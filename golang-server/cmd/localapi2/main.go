package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	api := r.Group("/api/v1")
	api.GET("/echo", func(c *gin.Context) {
		// Return JSON response
		c.JSON(http.StatusOK, gin.H{
			"message": "echo2",
		})
	})
	api.GET("/ping", func(c *gin.Context) {
		// Return JSON response
		c.JSON(http.StatusOK, gin.H{
			"message": "pong2",
		})
	})

	if err := r.Run(":3000"); err != nil {
		log.Fatalf("failed to run server: %v", err)
	}
}
