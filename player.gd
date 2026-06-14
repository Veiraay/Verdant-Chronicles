extends CharacterBody2D

const SPEED = 100.0
@onready var animated: AnimatedSprite2D = $animated


# Variabel untuk mengingat arah terakhir karakter menghadap
# Default kita set menghadap bawah
var arah_menghadap: String = "down" 
var hh: String = "down" 

func _physics_process(delta: float) -> void:
	
	# Mengambil input 4 arah sekaligus (menghasilkan Vector2)
	# Keuntungan get_vector: Otomatis mencegah karakter jalan lebih cepat saat gerak diagonal!
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Atur kecepatan pergerakan
	if input_dir != Vector2.ZERO:
		velocity = input_dir * SPEED
		update_arah_menghadap(input_dir) # Cari tahu arah mana dia bergerak
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
	
	# Jalankan animasi setelah pergerakan dihitung
	update_animasi(input_dir)


# --- FUNGSI MENCARI STRING ARAH ---
func update_arah_menghadap(dir: Vector2) -> void:
	# Membulatkan nilai arah agar presisi saat tombol ditekan bersamaan
	var x = sign(dir.x)
	var y = sign(dir.y)
	
	# Mencocokkan nilai X dan Y dengan string arah
	if x > 0 and y == 0:
		arah_menghadap = "wlkR"
		hh = "idleR"
	elif x < 0 and y == 0:
		arah_menghadap = "wlkL"
		hh = "idleL"
	elif x == 0 and y > 0:
		arah_menghadap = "wlkD"
		hh = "idleD"
	elif x == 0 and y < 0:
		arah_menghadap = "wlkT"
		hh = "idleT"
	elif x > 0 and y > 0:
		arah_menghadap = "wlkRD"
		hh = "idleRD"
	elif x < 0 and y > 0:
		arah_menghadap = "wlkLD"
		hh = "idleLD"
	elif x > 0 and y < 0:
		arah_menghadap = "wlkRT"
		hh = "idleRT"
	elif x < 0 and y < 0:
		arah_menghadap = "wlkLT"
		hh = "idleLT"


# --- FUNGSI MEMAINKAN ANIMASI ---
func update_animasi(dir: Vector2) -> void:
	if dir != Vector2.ZERO:
		# Jika sedang bergerak, gabungkan kata "walk_" dengan arahnya
		animated.play(arah_menghadap)
	else:
		# Jika berhenti (Vector2.ZERO), gabungkan kata "idle_" dengan arah terakhir
		animated.play(hh)
