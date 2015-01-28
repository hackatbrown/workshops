(ns clojure-webapp-example.web
  (:require [compojure.core :refer [defroutes GET POST]]
            [compojure.handler :refer [site]]
            [compojure.route :as route]
            [environ.core :refer [env]]
            [ring.util.response :refer [resource-response response]]
            [ring.middleware.json :as middleware]
            [ring.adapter.jetty :as jetty]))

(defn- example
  "example: list of ints -> list of ints
  I/P: alist, list of ints
  O/P: list of ints, aList all items + 1, filtered > 2"
  [alist]
  (let [newList (map #(+ 1 %) alist)]
    (->> newList
         (filter #(< 2 %)))))

(defn- addOne
  "addOne: int -> int
  I/P toAdd, int
  O/P toAdd increased by one"
  [toAdd]
  (inc toAdd))

(defroutes app-routes
  "The routes for our app"
  (GET "/example" [] {:status 200 ; 200 is ok, 300 is redirect, 400 is bad request, 500 is server side error
                      :body "Hello!"})

  (GET "/" [] (resource-response "index.html" {:root "public"}))

  (GET "/add1" [:as request]
       (let [toAdd (get-in request [:params :toAdd])
             toReturn (addOne (Integer. toAdd))]
         (response {:result toReturn}))) ; response just puts whatever follows into the body of a 200 response

  ; route/resources serves resources from the given root, this allows our index.html page to access the index.css
  ; http://weavejester.github.io/compojure/compojure.route.html#var-resources
  (route/resources "/" {:root "public"}))

(def app
  "Threads our routes handlers through a middleware the will wrap our responses in JSON"
  (-> app-routes
      (middleware/wrap-json-response)))


(defn -main
  "-main: nil -> starts server
  I/P: nil
  O/P: calls jetty/run-jetty which takes in a handler and options and starts a web server using that handler
  (doc on jetty/run-jetty http://ring-clojure.github.io/ring/ring.adapter.jetty.html)
  Our handler is defined by calling site on our app, which wraps our routes. Site does a few things for us like
  putting HTTP requests into an easily accessibly format, doc http://weavejester.github.io/compojure/compojure.handler.html#var-site"
  [& [port]]
  (let [port (Integer. (or port (env :port) 5000))]
    (jetty/run-jetty (site #'app) {:port port :join? false})))
