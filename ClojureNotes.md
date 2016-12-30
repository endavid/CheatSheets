Getting started
================
* http://clojure.org/guides/getting_started
* Install http://leiningen.org/

    lein repl

Then try,

    user=> (+ 1 2 3)
    6
    user=> (javax.swing.JOptionPane/showMessageDialog nil "Hello World")

* Start tutorial: http://www.braveclojure.com/do-things/

Cheatsheet
===========
http://clojure.org/api/cheatsheet


Language basics
================
With comparisons to other languages.
* Compared to Swift in most cases
* You can try Swift code online https://swiftlang.ng.bluemix.net/#/repl
* For Javascript code, just open the console in your browser.


Conditionals
------------

### if-else ###

    if (condition) {
      print("success")
      return "a"
    }
    else {
      print("fail")
      return "b"
    }

->

    (if condition
      (do (println "success") "a")
      (do (println "fail") "b")
    )

### when ###

    if (condition) {
      print "success"
      return "a"      
    }
    else {
      return nil
    }

->

    (when condition
      (println "success")
      "a"
    )

Nils and truthiness
--------------------

    (nil? nil) => true
    (if nil "yes" "no") => "no"
    (= nil nil) => true
    (or false nil) => nil
    (or nil false) => false

Last two are equivalent to Javascript,

   false || null => null
   null || false => false

Similar for "and",

    (and "a" nil false) => nil
    (and "a" false nil) => false


Name binding
------------

    var foo = "bar"
    foo = "hoge"

->

    (def foo "bar") => #'user/foo
    foo => "bar"
    (def foo "hoge") => #'user/foo
    foo => "hoge"

But in practice, you shouldn't redefine things. Think of them as "let", not "var"...

Data structures
---------------

    14 => int
    1.3 => float
    3/5 => a ratio
    "\"quotes\"" => a string with quotes
    :abc => a keyword
    :37 => a keyword
    {} => an empty map
    {:key1 "value1" :key2 "value2"} => a map
    (hash-map :k1 1 :k2 2) => {:k1 1 :k2 2}
    (get {:a 1 :b 2} :b "default-value") => 2
    ({:a 1 :b 2} :b) => 2
    (:b {:a 1 :b 2} "default-value") => 2
    [3 "a" 8] => a vector
    (get [3 2 1] 0) => 3
    (vector "a" 2 +) => ["a" 2 #object[clojure.core$\_PLUS\_...]
    (conj [1 2 3] 4) => [1 2 3 4]
    '(3 2 1) => (3, 2, 1), a list
    (nth '(:a 8 :c) 2) => :c
    (list 1 "2" 3) => (1 "2" 3)
    (conj '(1 2 3) 4) => (4 1 2 3)
    #{"a" 77 :b} => a set
    (hash-set "a" 77 :b) => #{"a" 77 :b}
    (conj #{1 2} 2) => #{1 2}
    (set [1 1 8 8 8 "a" "a"]) => #{1 "a" 8}
    (contains? #{1 "a" 8 :b} "a") => true
    (:b #{1 "a" 8 :b}) => :b
    (:c #{1 "a" 8 :b}) => nil
    (get #{1 "a" 8 :b} 8) => 8


_It is better to have 100 functions operate on one data structure than 10 functions on 10 data structures._ — Alan Perlis

I disagree... It depends on your problem... If you have 10 different problems, and you can represent them as 10 different classes, it is more clear having 10 functions for it, completely independent of the other problems, than having 100 functions for all the problems...


Functions
----------
### Function definition ###

    (defn function-name "docstring describing the function" [parameters] (function-body))

E.g.

    user=> (defn aha "says aha!" [name] (str "aha! " name))
    #'user/aha
    user=> (doc aha)
    -------------------------
    user/aha
    ([name])
      says aha!
    nil

    (aha "Maria") => "aha! Maria"

The function body can contain forms of any kind. It will return the last form evaluated.

    (defn f [] (+ 1 2) 30 "pep")
    (f) => "pep"

### Example function calls ###

    ((or + -) 1 2 3) => 6, because + is the first truthy operand
    ("test" 1 2) => ClassCastException, numbers and strings aren't functions

### Higher-order functions ###

Can either take a function as an argument or return a function.

    (map inc [0 2 4 6]) => (1 3 5 7); note it's a list, not a vector

I really don't like this... Because the order now changes...

    (map inc (conj [0 2 4] 6))   => (1 3 5 7)
    (conj (map inc [0 2 4]) 7)   => (7 1 3 5)

But there's mapv,

    (conj (mapv inc [0 2 4]) 7)  => [1 3 5 7]

### Special forms ###

Unlike function calls, they don't always evaluate all their operands. E.g. "if" statements.


### Arity overloading ###

In Swift,

    func f(_ a: Int) {
      print(a)
    }
    func f(_ a :Int,_ b: Int) {
      print(a+b)
    }
    f(1)    => 1
    f(1,2)  => 3

Notice that this is not possible in Javascript,

    function f(a) { console.log(a); }
    function f(a,b) { console.log(a + b); }

    f(1) => NaN, because b is null

In Clojure,

    (defn f
      ([a] (println a))
      ([a b] (println (+ a b)))
    )

    (f 1)    => 1, returns nil
    (f 1 2)  => 3, returns nil

You can use this to provide default arguments,

    (defn f
      ([a b] (println (+ a b)))
      ([a] (f a 999))
    )

    (f 1)   => 1000, returns nil

Personally, I think Javascript is more consistent... Forget about overloads. To achieve the same thing, you could do,

    function f(a,b) { b = b || 999; console.log(a + b); }

    f(1)  => 1000

### Variadic functions ###

In Javascript,

    function average() {
      for (var i = 0, sum = 0, n = arguments.length; i < n; i++) {
        sum += arguments[i];
      }
      return sum / n;
    }

    average(1, 2, 9);   => 4

In Clojure,

    (defn average
      [& arguments]
      (/ (apply + arguments) (count arguments))
    )

    (average 1 2 9)   => 4


### Destructuring ###

You can give names to inner arguments in the variadic list,

    (defn f
      [[a b & others]]
      (println (str "sum of first two: " (+ a b)))
      (println (str "sum of the rest: " (apply + others)))
    )
    (f [1, 2, 4, 9])
    sum of first two: 3
    sum of the rest: 13
    nil

    (defn birthday
      [{day :day month :month}]
      (str day "/" month)
    )
    (birthday {:year 1978 :month 11 :day 14})
    "14/11"

    (defn birthday
      [{:keys [day month] :as date}]
      (println date)
      (str day "/" month)
    )
    (birthday {:year 1978 :month 11 :day 14})
    {:year 1978, :month 11, :day 14}
    "14/11"


In Swift, you don't need "destructuring" because all the parameters are named. You can have "others" as variadic,

    func f(_ a :Int,_ b: Int, _ others: Int...) {
        print("sum of first two \(a+b)")
        var sum = 0
        for n in others {
            sum += n
        }
        print("sum of others \(sum)")
    }
    f(1,2)
    sum of first two 3
    sum of others 0
    f(1,2,4,9)
    sum of first two 3
    sum of others 13

### Anonymous functions ###

Basically lambdas,

    (fn [param-list] body)

Or with reader macros,

    #(body %)    % is the argument

E.g.

    (map (fn [a] (* a 3)) [1 2 8])  => (3, 6, 24)
    (map #(* % 3) [1 2 8])          => (3, 6, 24)
    (#(apply str %&) 3 "pop" :aha)  => "3pop:aha"


The returned functions are _closures_, they can access all the variables in the scope they were created.
E.g.

    (defn mult-maker
      "Create a multiplier function"
      [mult-by]
      #(* % mult-by))
    (def mult4 (mult-maker 4))
    (map mult4 [1 4 3])        => (4 16 12)


Scope
-----
"let" introduces a new scope

    (def x 0)
    (let [x 1] x)
    ; => 1

Loops
-----

### loop ###
Using recursion,

    (loop [iteration 0]
      (println (str "Iteration " iteration))
      (if (> iteration 3)
        (println "Goodbye!")
        (recur (inc iteration))))
    ; => Iteration 0
    ; => Iteration 1
    ; => Iteration 2
    ; => Iteration 3
    ; => Iteration 4
    ; => Goodbye!
    nil

### reduce ###
Process each element in a sequence and build a result,

    (reduce + [1 2 3 4])
    (reduce + 1 [2 3 4])

are equivalent to

    (+ (+ (+ 1 2) 3) 4)


Regular expressions
--------------------

    #"regular-expression"



Creating a project
===================
* http://www.braveclojure.com/getting-started/

    lein new app clojure-test
    cd clojure-test
    # to run
    lein run
    # to create a distributable
    lein uberjar
    # to run the distributable
    java -jar target/uberjar/clojure-test-0.1.0-SNAPSHOT-standalone.jar


From the tutorial,
_and gloat to your colleagues who are still using last decade’s languages_

Fine, but in the 2nd chapter is telling you to install Emacs... An editor from 1976...


Debugging
=========

    user=> (#((println (str "sum of first two: " (+ %1 %2)))
      #_=>    (println (str "sum of others: " (apply + %&)))
      #_=>   ) 1 2 4 9)
    sum of first two: 3
    sum of others: 13

    NullPointerException   user/eval1423/fn--1424 (form-init7703492075111061861.clj:1)

No idea about that one... I need more useful error messages...
