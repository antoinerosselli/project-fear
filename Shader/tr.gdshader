shader_type canvas_item;

// Couleur de base du ColorRect
uniform vec4 baseColor : source_color = vec4(1.0);

// Contrôle de la fonte (valeur entre 0 et 1)
uniform float dissolveSlider : hint_range(0.0, 1.0) = 0.0; 
uniform float holeScale : hint_range(5.0, 50.0) = 15.0;  // Taille des trous
uniform float holeDensity : hint_range(0.5, 5.0) = 1.5;  // Densité des trous

// Contours lumineux des trous
uniform vec4 edgeColor : source_color = vec4(1.0, 0.5, 0.0, 1.0); // Couleur des bords (feu/lave)
uniform float edgeThickness : hint_range(0.0, 0.5) = 0.08; // Épaisseur des bords
uniform float edgeGlowIntensity : hint_range(1.0, 10.0) = 5.0; // Intensité du glow

// Animation
uniform bool enable_dissolve_animation = false;
uniform float animation_speed : hint_range(0.0, 5.0, 0.1) = 1.0;

// Fonction de bruit aléatoire (remplace Perlin/Simplex)
float random(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

void fragment() {
    vec2 uv = UV * holeScale;  // Ajuste la taille des trous

    // Génération des trous avec du bruit
    float holePattern = noise(uv * holeDensity) * 0.5 + 0.5;

    // Animation optionnelle du bruit (les trous "bougent")
    if (enable_dissolve_animation) {
        float time_factor = TIME * animation_speed;
        holePattern += sin(time_factor + uv.x * 2.0 + uv.y * 1.5) * 0.1;
    }

    // Calcul de la dissolution
    float dissolveFactor = step(holePattern, dissolveSlider);

    // Génération des contours lumineux (glow plus intense)
    float edgeFactor = smoothstep(dissolveSlider, dissolveSlider - edgeThickness, holePattern);
    vec3 glowColor = edgeColor.rgb * edgeGlowIntensity * edgeFactor;

    // Couleur finale (bords + intérieur)
    vec3 finalColor = mix(glowColor, baseColor.rgb, dissolveFactor);

    // Application de la transparence
    COLOR = vec4(finalColor, dissolveFactor * baseColor.a);
}
