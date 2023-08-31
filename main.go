package main

import (
	"flag"
	"log"

	"github.com/gofiber/fiber/v2"
)

func main() {
	listenPort := flag.String("l", ":8000", "listening port. e.g. -l :8080")
	flag.Parse()
	app := fiber.New()
	pool := app.Group("/api/v1/pool")
	node := app.Group("/api/v1/node")
	node.Get("/servers")
	pool.Get("/members")
	log.Fatal(app.Listen(*listenPort))
}
