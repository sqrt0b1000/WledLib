# ``WledLib``

Swift library providing access to the status of a WLED strip.

## Usage

The protocol ``WledHost`` is responsible for accessing the WLED strips.
It only requires an ``WledHost/hostname`` implementation.
If there is no special class representing the WLED strip, write an extension for [String](swift//String).

## Features

## Topics

### Host

- ``WledHost``

### Data struct

- <doc:WLED-Data-Structs>
- <doc:Helper-Data>

### HTTP Get Data Structs

Structs that can be fetched through HTTP requests.

- ``Device``
- ``Presets``

### HTTP Post Data Struct

Struct that can be posted through HTTP requests.

- ``State``

### Socket Data Structs

Structs that are received through a web socket.

- ``Device``

### Protocols

- <doc:Protocols>
