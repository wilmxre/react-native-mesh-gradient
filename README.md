# @wilmxre/react-native-mesh-gradient

`@wilmxre/react-native-mesh-gradient` is a React Native component for creating smooth, animated mesh gradients, by exposing the native [MeshGradient API](https://developer.apple.com/documentation/swiftui/meshgradient) to React Native. 
This library is iOS only.


<details open>
  
<summary><b>Concept</b></summary>

 ## Concept

<img src="https://github.com/user-attachments/assets/593dd534-138d-4744-8e9d-ad125c5dcec0" alt="Mesh" width="600"/>
<img src="https://github.com/user-attachments/assets/d08fad06-36cc-4e79-9b3d-ac405eb710eb" alt="MeshGradient with Points" width="600"/>
<img src="https://github.com/user-attachments/assets/2d34641c-1d46-4090-bd0b-e83e16957999" alt="MeshGradient Modified" width="600"/>
<img src="https://github.com/user-attachments/assets/8a2fdc7e-a2b3-4ca4-a337-33bda26dde6f" alt="MeshGradient" width="600"/>

</details>

<details open>

<summary><b>Description (copied from Apple Docs)</b></summary>

## Description (copied from Apple Docs)

Each vertex has a position, a color and four surrounding Bezier control points (leading, top, trailing, bottom) that define the tangents connecting the vertex with its four neighboring vertices. (Vertices on the corners or edges of the mesh have less than four neighbors, they ignore their extra control points.) Control points may either be specified explicitly or implicitly.

When rendering, a tessellated sequence of Bezier patches are created, and vertex colors are interpolated across each patch, either linearly, or via another set of cubic curves derived from how the colors change between neighbors – the latter typically gives smoother color transitions.

</details>

<details open>
  
<summary><b>Prerequisite</b></summary>

## Prerequisite

The native API is still in beta and it only supports `iOS 18.0+` so far. Be aware of this, if you want to use this component. 
You can read more on the Apple Official Documentation: https://developer.apple.com/documentation/swiftui/meshgradient

</details>

<details open>
  
<summary><b>Installation</b></summary>

## Installation

You can install the package using npm or yarn:

```bash
npm install @wilmxre/react-native-mesh-gradient && cd ios && pod install
```

or

```bash
yarn add @wilmxre/react-native-mesh-gradient && cd ios && pod install
```

</details>

<details open>

<summary>Expo support</summary>

## Expo support

To use this library with Expo, you will need to create a development build. Expo Go does not support custom native modules. For information on how to create and run a development build, visit:  [Create a development build - Expo Documentation](https://docs.expo.dev/develop/development-builds/create-a-build/). 

</details>


<details open>
  
<summary><b>Usage</b></summary>

## Usage

```jsx
import React from 'react';
import { StyleSheet, View } from 'react-native';
import { MeshGradient } from 'react-native-mesh-gradient';

const  MATRIX_DIMENSION  =  3;

const points = [
    [0.0, 0.0], [0.2, 0.0], [1.0, 0.0],
    [0.0, 0.3], [0.4, 0.9], [1.0, 0.1],
    [0.0, 1.0], [0.3, 1.0], [1.0, 1.0],
];

const primaryColors = [
    "#E68369", "#E68369", "#B692C2",
    "#B692C2", "#FBF6E2", "#FBF6E2",
    "#E68369", "#E68369", "#E68369",
];

const secondaryColors = [
    "#000000", "#000000", "#000000",
    "#FF9F0A", "#FF453A", "#FF9F0A",
    "#5E5CE6", "#000000", "#30D158",
];

const App = () => {
  return (
    <View style={styles.container}>
      <MeshGradient
        meshWidth={MATRIX_DIMENSION}
        meshHeight={MATRIX_DIMENSION}
        style={styles.meshContainer}
        points={points}
        primaryColors={primaryColors}
        secondaryColors={secondaryColors}
        background="#ffffff"
        smoothsColors={true}
        colorSpace="perceptual"
        borderRadius={24}
        isAnimated={true}
        borderRadius={10}
        animationDuration={2000}
        animationType="easeInOut"
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  meshContainer: {
    justifyContent: "center",
    alignItems: "center",
    width: 350,
    height: 350,
  },
});
```
</details>


<details open>
  
<summary><b>Demo</b></summary>

## Demo

### 1. Static MeshGradient

<img src="https://github.com/user-attachments/assets/749554c2-f4dd-4162-8887-b1afc3f59237" alt="Static MeshGradient 1" width="330"/>
<img src="https://github.com/user-attachments/assets/d98bc0fd-8b9f-44fe-80c7-aa9b69baad91" alt="Static MeshGradient 2" width="330"/>
<img src="https://github.com/user-attachments/assets/cfd71e5f-aa19-4fa8-8064-bcd7f42a44ff" alt="Static MeshGradient 3" width="330"/>
<img src="https://github.com/user-attachments/assets/9329f468-bfb0-4ba2-a3d8-ec5cdbd6996d" alt="Static MeshGradient 4" width="330"/>
<img src="https://github.com/user-attachments/assets/31eb4547-99c9-4657-b0b5-0457879ec2e0" alt="Static MeshGradient 5" width="330"/>
<img src="https://github.com/user-attachments/assets/eab5516f-1a37-462e-83f1-8ce75040d381" alt="Static MeshGradient 6" width="330"/>

### 2. Animated MeshGradient with `easeInOut` animation

https://github.com/user-attachments/assets/39a029af-cc56-4de5-930e-3783e7da6127

### 3. Animated MeshGradient with `sine` animation

https://github.com/user-attachments/assets/bcb0e8f9-c38c-41f9-968d-7976ccbca01c

</details>

<details open>
  
<summary><b>Props</b></summary>

## Props

### `meshWidth` (number) [required]

The width of the mesh, i.e. the number of vertices per row. Default is `3`.

### `meshHeight` (number) [required]

The height of the mesh, i.e. the number of vertices per column. Default is `3`.

### `points` (number[][]) [required]

An array of points defining the mesh. Each point is an array of two numbers representing the x and y coordinates.

### `primaryColors` (string[]) [required]

An array of primary colors containing `width x height` elements. The colors should be in 6 digit hex format (ex.: `#FF9F0A`).

### `secondaryColors` (string[]) [optional]

An array of secondary colors containing `width x height` elements. The colors should be in 6 digit hex format (ex.: `#FF9F0A`). Only required, if `isAnimated` is true. 

### `background` (string) [optional]

The background color fills any points outside the defined vertex mesh. Default is [`.clear`](https://developer.apple.com/documentation/uikit/uicolor/1621945-clear) (a color object with grayscale and alpha values that are both 0.0`).

### `smoothsColors` (boolean) [optional]

Determines whether cubic (smooth) interpolation should be used for the colors in the mesh (rather than only for the shape of the mesh). Default is `true`.

### `colorSpace` ("device" | "perceptual") [optional]

The color space in which to interpolate vertex colors. Can be `device` or `perceptual`. Default is `device`.

### `isAnimated` (boolean) [optional]

Specifies if the gradient should be animated. Default is `false`.

### `borderRadius` (number) [optional]

The border radius of the MeshGradient view. Default is `0`.

### `animationDuration` (number) [optional]

The length of time, expressed in seconds, that the animation takes to complete. Default is `5`. Specify only if `isAnimated` prop is true.

### `animationType` ("sine" | "easeInOut") [optional]

The type of animation to use. Can be `"sine"` or `"easeInOut"`. Default is `"sine"`. Specify only if `isAnimated` prop is true.

</details>

<details open>
  
<summary><b>Contributing</b></summary>

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or bug fixes.

</details>

<details open>
  
<summary><b>License</b></summary>

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

</details>

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
