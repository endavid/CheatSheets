Effective Javascript
====================

Language
---------

### 1. Write your files so that they behave the same in either mode ###

    (function() {
      "use strict";
      // your code
    })();

### 19. Higher-order functions ###

Functions that take functions as arguments or that return functions.

### 20. Use call to call methods with a custom receiver ###

    f.call(obj, arg1, arg2, arg3);

### 22. Use arguments to Create Variadic Functions ###

    function average() {
      for (var i = 0, sum = 0, n = arguments.length; i < n; i++) {
        sum += arguments[i];
      }
      return sum / n;
    }
    var avg = average(1, 2, 9);

### 21. Use apply to Call functions with different number of arguments ###

    average.apply(null, [1, 2, 9]);

### 26. Use bind to Curry Functions ###

    function simpleURL(protocol, domain, path) {
      return protocol + "://" + domain + "/" + path;
    }
    var urls = paths.map(simpleURL.bind(null, "http", siteDomain));

### 33. Make your Constructors new-Agnostic ###

    function User(name, pwd) {
      var self = this instanceof User ? this : Object.create(User.prototype);
      self.name = name;
      self.pwd = pwd;
    }

### 34. Store methods on prototypes ###

Storing methods on a prototype makes them available to all instances without requiring multiple copies of the functions that implement them or extra properties on each instance object.
Modern JS engines heavily optimize prototype lookups. So instance methods may not be faster, and they use more memory than prototype methods.

### 35. Use closures to store private data ###

    function User(name) {
      // instead of this.name = name,
      this.toString = function() {
        return "[User ]" + name "]";
      }
    }

### 44. Use null prototypes to prevent prototype pollution ###

Someone could have added unwanted properties even to Object.prototype!

    var x = Object.create(null);
    Object.getPrototypeOf(x) === null; // true

Now you can safely use "x" as a dictionary.

### 45. Use hasOwnProperty to protect against prototype pollution ###

Here's a safer version of a dictionary, instead of just using an empty Object.

    function Dict(elements) {
      this.elements = elements || {};
    }
    Dict.prototype.has = function(key) {
      return {}.hasOwnProperty.call(this.elements, key);
    }
    Dict.prototype.get = function(key) {
      return this.has(key) ? this.elements[key] : undefined;
    }
    Dict.prototype.set = function(key, val) {
      this.elements[key] = val;
    }
    Dict.prototype.remove = function(key) {
      delete this.elements[key];
    }

### 52. Prefer array literals to the Array constructor ###

These behave the same,
    ["hello"]
    new Array("hello")

But it's not consistent with the behaviour if you pass a number,
    [17]
    new Array(17); // creates an empty array of length 17


API design
-----------

### 55. Accept Options objects for keyword arguments ###

Self-documenting API.
Note to self: like Objective-C named parameters

    var alert = new Alert({x: 100, y: 50, color: "white"})
    function Alert(opts) {
      opts = opts || {};
      this.x = opts.x || 0;
      this.y = opts.y || 0;
      this.color = opts.color || "gray";
    }

You can use the "extend" function to make life easier,

    function Alert(opts) {
      opts = extend({
        x: 0,
        y: 0,
        color: "gray"
      }, opts);
      extend(this, opts);
    }

### 56. Avoid unnecessary state ###

While state is sometimes essential, stateless APIs tend to be easier to learn and use, more self-documenting, and less error-prone.

### 57. Use structural typing for flexible interfaces ###

Structural typing = duck typing


### 60. Support method chaining ###

Known as the *fluent style* for stateful APIs.

jQuery example

    $("#bla")
    .html("Something")
    .removeClass("info")
    .addClass("error")

Note to self: return \*this in C++ setters.

Concurrency
-----------

### 61. Don't block the event queue on I/O ###

Use async functions.

Workers, from the Worker API, are executed in a completely isolated state, with no access to the global scope or web page contents of the application's main thread, so they cannnot interfere with the execution of code running in from the main event queue. Synchronous functions in a worker are less problematic.

### 64. Use recursion for asynchronous loops ###

    function getOneAsync(objs, onsuccess, onfailure) {
      var n = objs,length;
      function tryNext(i) {
        if (i >= n) {
          onfailure("all failed");
          return;
        }
        doAsync(obj[i], onsuccess, function() {
          tryNext(i+1);
        });
      }
      tryNext(0);
    }

Notice that we won't get a stack overflow, because async APIs return immediately --before their callbacks are invoked.

### 65. Don't block the event queue on computation ###

*(a) Use Workers*

    var ai = new Worker("ai.js");

    // send messages to the Worker
    ai.postMessage(JSON.stringify({
      userMove: userMove
    }));

    // register event handler
    ai.onmessage = function(event) {
      executeMove(JSON.parse(event.data).computerMove);
    };

    // ai.js Worker code
    self.onmessage = function(event) {
      var userMove = JSON.parse(event.data).userMove;
      var computerMove = computeNextMove(userMove);
      var message = JSON.stringify({
        computerMove: computerMove
      });
      self.postMessage(message);
    }

*(b) Break up algorithm into multiple steps*

Convert a loop into an asycn recursive loop (64)

    Member.prototype.inNetwork = function(other, callback) {
      var visited = {};
      var worklist = [this];
      function next() {
        if (worklist.length === 0) {
          callback(false);
          return;
        }
        var member = worklist.pop();
        // ...
        if (member === other) { // found?
          callback(true);
          return;
        }
        // ...
        setTimeout(next, 0); // schedule the next iteration
      }
      setTimeout(next, 0); // schedule the first iteration
    }
