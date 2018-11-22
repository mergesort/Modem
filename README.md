# Modem
A routing, serialization, and deep link handling framework all wrapped up in one

## This is experimental and a work in progress! I wouldn't recommend using it in production.

---

README in progress:

- NSUserActivity is underused externally, but has become a foundational building block of iOS navigation and actions.
- Extremely evident with the addition of Siri, users expect to be able to take specific actions at specific times from anywhere.
- Your screens should be mapped to them, to give your users the best ability to engage with your app.
- Having a proper map of your application can help you better understand the path of your user's journey.
- You can log it.
- You can send down specific paths for a user to take externally *even from a server or push notification*.

A few things to note:

1. Everything can be converted to/from an `NSUserActivity`.
2. There are 3 distinct entry points currently covered in the `AppDelegate` which can all be deferred to the router. Via regular launch, opening from NSUserActivity, or a notification.
3. You can get your entire stack printed, which is good for logging a user’s path through an app.
4. Anything in “App Additions” is stuff you’re going to have to manually configure for your app’s usage. Like universal link handling is clearly dependent on your app/websites’s URL schemes.
5. I haven’t done the decoding phase, which is taking a `NSUserActivity` and turning it into a model, but you should be able to do that to make all of the navigation statically typed.
6. There’s no coordinator-like pattern yet, but there’s no reason that can’t be built on top of the router.

