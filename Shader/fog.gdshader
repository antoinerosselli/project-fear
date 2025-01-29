shader_type fog;

void fog() {
	DENSITY = 1.;
	ALBEDO = OBJECT_POSITION;
}
