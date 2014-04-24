precision mediump float;

uniform mat4 uProjection;
uniform mat4 uModel;
uniform mat4 uView;

attribute vec3 aPosition;
attribute vec3 aNormal;
varying vec3 vNormal;

precision mediump float;

void main() {
  vNormal = aNormal;
  gl_Position = uProjection * uView * uModel * vec4(aPosition, 1.0);
}
