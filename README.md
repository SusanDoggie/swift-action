# swift-action

[GitHub Actions](https://github.com/features/actions) for building [Swift](https://swift.org).

## Usage

```
uses: SusanDoggie/swift-action@v1
with:
  action: build
uses: SusanDoggie/swift-action@v1
with:
  action: test
```

## Inputs

### `action`

**Required** Swift action to run.

### `configuration`

Debug or release mode.

### `use_xcodebuild`

Using xcodebuild to build project. Default `false`.

### `sdk`

Select sdk to build. Default `macosx`.

### `destination`

Select destination for testing.

### `enable_codecov`

Enable code coverage. Default `false`.

## License

swift-action is licensed under the [MIT license](LICENSE)
