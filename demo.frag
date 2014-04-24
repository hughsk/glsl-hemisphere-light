precision mediump float;

uniform mat4 uModel;
uniform mat4 uView;
uniform vec3 uEye;
varying vec3 vNormal;

#pragma glslify: hemisphere = require(./index)

void main() {
  vec3 sky = vec3(1.0, 1.0, 0.9);
  vec3 gnd = vec3(0.1, 0.1, 0.35);

  vec3 direction = vec3(0.0, 1.0, 0.0);

  vec3 lighting = hemisphere(
      vNormal
    , sky
    , gnd
    , direction
    , uModel
    , uView
    , uEye

    , 20.0
    , 0.2
  );

  gl_FragColor = vec4(lighting, 1.0);
}
