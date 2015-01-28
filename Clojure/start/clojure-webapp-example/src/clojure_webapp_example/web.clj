(ns clojure-webapp-example.web
  (:require [compojure.core :refer [defroutes GET POST]]
            [compojure.handler :refer [site]]
            [compojure.route :as route]
            [ring.util.response :refer [resource-response response]]
            [ring.middleware.json :as middleware]
            [ring.adapter.jetty :as jetty]))

