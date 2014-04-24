# glsl-hemisphere-light [![experimental](http://hughsk.github.io/stability-badges/dist/experimental.svg)](http://github.com/hughsk/stability-badges) #

A reusable GLSL hemisphere light function.

[view demo](http://hughsk.io/glsl-hemisphere-light)

[![glsl-hemisphere-light](http://imgur.com/CdkhxU5.png)](http://hughsk.io/glsl-hemisphere-light)

## Usage ##

[![glsl-hemisphere-light](https://nodei.co/npm/glsl-hemisphere-light.png?mini=true)](https://nodei.co/npm/glsl-hemisphere-light)

Exports `vec3 hemisphere_light()`, which takes the following arguments:

* `vec3 normal`: This point's normal vector.
* `vec3 sky`: The "sky" color, cast from above the object.
* `vec3 ground`: The "ground" color, cast from below the object.
* `vec3 lightDirection`: The direction of the light to cast – normalized.
* `mat4 modelMatrix`: The model matrix.
* `mat4 viewMatrix`: The view matrix.
* `vec3 viewPosition`: The position of the camera in world space.

If you wish to include specular lighting too, simply add these two extra
parameters when calling the function:

* `float shininess`: Set to lower values for matte, higher for gloss.
* `float specularity`: The amount by which to scale the specular light cast on
  the object.

Also worth checking out:

* [A brief explanation from Udacity](https://www.youtube.com/watch?v=l7k32_BvkWA).
* [Example in three.js](http://pages.cs.wisc.edu/~lizy/mrdoob-three.js-ef5f05d/examples/webgl_lights_hemisphere.html).
* [The three.js implementation upon which this is based](http://git.io/R32neA).

## License ##

MIT. See [LICENSE.md](http://github.com/hughsk/glsl-hemisphere-light/blob/master/LICENSE.md) for details.
