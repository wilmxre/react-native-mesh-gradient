
# react-native-mesh-gradient

`react-native-mesh-gradient` is a React Native component for creating smooth, animated mesh gradients, by exposing the native [MeshGradient API](https://developer.apple.com/documentation/swiftui/meshgradient) to React Native. 
This library is iOS only.



## Prerequisite

The native API is still in beta and it only supports `iOS 18.0+` so far. Be aware of this, if you want to use this component. 
You can read more on the Apple Official Documentation: https://developer.apple.com/documentation/swiftui/meshgradient

## Installation

You can install the package using npm or yarn:

```bash
npm install react-native-mesh-gradient
```

or

```bash
yarn add react-native-mesh-gradient
```

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

## Props

### `meshWidth` (number) [required]

The width of the mesh, i.e. the number of vertices per row. Default is `3`.

### `meshHeight` (number) [required]

The height of the mesh, i.e. the number of vertices per column. Default is `3`.

### `points` (number[][]) [required]

An array of points defining the mesh. Each point is an array of two numbers representing the x and y coordinates.

### `primaryColors` (string[]) [required]

An array of primary colors containing `width x height` elements.

### `secondaryColors` (string[]) [optional]

An array of secondary colors containing `width x height` elements. Only required, if `isAnimated` is true.

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

The length of time, expressed in seconds, that the animation takes to complete. Default is `5`.

### `animationType` ("sine" | "easeInOut") [optional]

The type of animation to use. Can be `"sine"` or `"easeInOut"`. Default is `"sine"`.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
