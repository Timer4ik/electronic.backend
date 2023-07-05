const ReviewController = require("../controllers/review-controller")

const Router = require("express").Router

const router = Router()

router.get("/review", ReviewController.getReviews)
// router.get("/review/:id", ReviewController.getPropertyById)
router.post("/review", ReviewController.createReview)
// router.put("/review/:id", ReviewController.updateProperty)
// router.delete("/review/:id", ReviewController.deleteProperty)

module.exports = router