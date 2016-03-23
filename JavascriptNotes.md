Effective Javascript
====================

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

### 34. Store methods on prototypes

Storing methods on a prototype makes them available to all instances without requiring multiple copies of the functions that implement them or extra properties on each instance object.
Modern JS engines heavily optimize prototype lookups. So instance methods may not be faster, and they use more memory than prototype methods.
