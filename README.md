# Sample proxy for simple app level scopes
This setup contains the following:

* apiproxy complete with read and write endpoints
 ** each of them in turn has it's own oauth enforcemtn
* apiproduct for read
* apiproduct for write
* developer
* developer app for readOnly (only uses the read apiproduct)
* developer app for read/write (uses both products)

## The layout
The apiproxy is stored not unsurprisingly in the `apiroxy` directory

The configuration is stored under config. Therein you'll find json structures for
the products, developer, and the two developer apps.

This setup also contains a fully automated deloypment script

## Deploying the setup
Simply run: 

`mvn install -Dorg=yourorg -Denv=yourenv -Dusername=yourusername -Dpassword=yourpass`

Where you update each of the parameters as appropriate. The proxy, products, developer,
and developer apps will all be deployed automatically.

## Testing
In addition to the deployment this setup will also run a number of integration tests stored here:

`/test/integration/features/scope-test.feature`

These tests fetch a token and then use that token for the subsequent calls.

*NOTE:*
At this point i've had to make a change to apickli to get the tests to work. I'm working with Sean and
Ozan to get that change officially rolled into apickli at which time I'll update this repo again and 
all will work as designed. It does work on my own laptop, but i've made the change to apickli manually.

