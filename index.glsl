/**
 * Hemisphere Light.
 *
 * A nicer style of ambient lighting, which provides you with directional
 * light cast from both above and below the object.
 *
 * Explanation video, sourced from Udacity:
 * https://www.youtube.com/watch?v=l7k32_BvkWA
 *
 * Example in three.js:
 * http://pages.cs.wisc.edu/~lizy/mrdoob-three.js-ef5f05d/examples/webgl_lights_hemisphere.html
 *
 * Adapted for glslify from implementation in three.js:
 * http://git.io/R32neA
 *
 * @param {vec3} normal This point's normal vector.
 * @param {vec3} sky    The "sky" color, cast from above the object.
 * @param {vec3} ground The "ground" color, cast from below the object.
 *
 * @param {vec3} lightDirection The direction of the light to cast – normalized.
 * @param {mat4} modelMatrix    The model matrix.
 * @param {mat4} viewMatrix     The view matrix.
 * @param {vec3} viewPosition   The position of the camera in world space.
 *
 * The following parameters are optional, but must be specified together:
 *
 * @param {float} shininess   Set to lower values for matte, higher for gloss.
 * @param {float} specularity The amount by which to scale the specular light
 *                            cast on the object.
 *
 * @return {vec3} The color of the light to cast on this point.
 */
vec3 hemisphere_light(
    vec3 normal
  , vec3 sky
  , vec3 ground

  , vec3 lightDirection
  , mat4 modelMatrix
  , mat4 viewMatrix
  , vec3 viewPosition
) {
  vec3 direction = normalize((
    modelMatrix * vec4(lightDirection, 1.0)
  ).xyz);

  float weight = 0.5 * dot(
      normal
    , direction
  ) + 0.5;

  return mix(ground, sky, weight);
}

vec3 hemisphere_light(
    vec3 normal
  , vec3 sky
  , vec3 ground

  , vec3 lightDirection
  , mat4 modelMatrix
  , mat4 viewMatrix
  , vec3 viewPosition

  , float shininess
  , float specularity
) {
  vec3 direction = normalize((
    modelMatrix * vec4(lightDirection, 1.0)
  ).xyz);

  float weight = 0.5 * dot(
      normal
    , direction
  ) + 0.5;

  vec3 diffuse = mix(ground, sky, weight);

  vec3 specDirection = normalize((
    viewMatrix * modelMatrix * vec4(lightDirection, 1.0)
  ).xyz);

  float skyWeight = 0.5 * dot(
      normal
    , normalize(specDirection + viewPosition)
  ) + 0.5;

  float gndWeight = 0.5 * dot(
      normal
    , normalize(viewPosition - specDirection)
  ) + 0.5;

  vec3 specular = specularity * diffuse * (
    max(pow(skyWeight, shininess), 0.0) +
    max(pow(gndWeight, shininess), 0.0)
  ) * weight;

  return diffuse + specular;
}

#pragma glslify: export(hemisphere_light)
