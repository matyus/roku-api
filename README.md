# Roku API

This API exists because the CORS policy for the Roku box is configured in such a way that makes it impossible to get any useful callback information using AJAX methods.

## Getting Started

- Get your Roku box IP Address: `Settings > Network > Wireless (or Wired) > IP address` (i.e. `192.168.1.4`)
- Clone this repo and `bundle install`
- Run `bundle exec rails s`
- See [`config/routes.rb`](./config/routes.rb) for the available API methods.
- I recommend [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en) for testing these routes.

## Ruby version

This was built on a Mac OSX.

```
ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-darwin15]
```

## Dependencies

- A Roku box
- Access to your LAN (Local Area Network)
- There is barely any information actually being stored, so the default SQLite is fine: See [`app/models/roku_box.rb`](./app/models/roku_box.rb) for details on what info you'll need.

## Creating the `RokuBox` record

**Note:** There is no interface for doing this yet, so until then:

1. Open rails console `bundle exec rails console`

2. Create a new record:

```ruby
roku = RokuBox.new
roku.name = "Living Room" # This isn't really necessary unless you plan on storing multiple records.
roku.ip_address = "ROKU.IP.ADDR.ESS"
# Note: roku.port is configurable, but the default in their documentation is :8060, so you shouldn't have to actually set this.
roku.save
```
3. You should now be able to make POST requests to the Roku box.

## API Methods

- See [`config/routes.rb`](./config/routes.rb) for the available API methods.

### POST `/app`

Returns JSON blob:

```js
{
  "apps": {
    "app": [
     {
        "__content__": "Netflix",
        "id": "12",
        "type": "appl",
        "version": "4.2.75018030"
      },
      {
        "__content__": "Amazon Video",
        "id": "13",
        "type": "appl",
        "version": "6.2.0"
      },
      //...
    ]
  }
}
```

### POST `/active-app`

```js
{
  "active_app": {
    "app": "Roku"
  }
}
```

### POST `/keypress/:command`

```js
// Nothing useful is returned
```

### POST `/launch-app/:app_id`

```js
// Nothing useful is returned
```
