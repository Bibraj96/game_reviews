  
blend = User.create(name: "Blend", email: "blend@blend.com", password: "password")
amanda = User.create(name: "Amanda", email: "amanda@amanda.com", password: "password")

Review.create(content: "Great game!", game: "Persona 5", user_id: blend.id)
Review.create(content: "This game's pace was too slow!", game: "Astral Chain", user_id: amanda.id)