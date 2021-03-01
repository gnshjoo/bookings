package main

import (
	"fmt"
	"github.com/gnshjoo/bookings/internal/config"
	"github.com/go-chi/chi"
	"testing"
)

func TestRoutes(t *testing.T) {
	app = config.AppConfig{}

	mux := routes(&app)

	switch v := mux.(type) {
	case *chi.Mux:
		// do nothing
	default:
		t.Error(fmt.Sprintf("type is not *chi.Mux, but it is %T", v))

	}
}
