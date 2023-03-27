const db = require("../../db.js")
const { DataTypes } = require("sequelize")

const Category = db.define("category", {
    category_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING },
})

const SubCategory = db.define("sub_category", {
    sub_category_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    category_id: { type: DataTypes.INTEGER, allowNull: false },
    name: { type: DataTypes.STRING },
})

Category.hasMany(SubCategory, { foreignKey: "category_id" })
SubCategory.belongsTo(Category, { foreignKey: "category_id" })

const Product = db.define("product", {
    product_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING },
    is_active: { type: DataTypes.BOOLEAN },
    descr: { type: DataTypes.STRING },
    price: { type: DataTypes.FLOAT, defaultValue: 0 },
    image_url: { type: DataTypes.STRING },
    sub_category_id: { type: DataTypes.INTEGER, allowNull: false },
})

SubCategory.hasMany(Product, { foreignKey: "sub_category_id" })
Product.belongsTo(SubCategory, { foreignKey: "sub_category_id" })

const User = db.define("user", {
    user_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING(100), allowNull: false },
    email: { type: DataTypes.STRING(100), allowNull: false, unique: true },
    password: { type: DataTypes.STRING(100), allowNull: false },
    role: { type: DataTypes.STRING(20), defaultValue: "user" }
}, {
    timestamps: true
})

const Order = db.define("order", {
    order_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    user_id: { type: DataTypes.INTEGER },
    status_id: { type: DataTypes.INTEGER, defaultValue: 0 },
}, {
    timestamps: true
})
const OrderProduct = db.define("order_product", {
    order_product_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    order_id: { type: DataTypes.INTEGER, allowNull: false },
    product_id: { type: DataTypes.INTEGER, allowNull: false },
})

User.hasMany(Order, { foreignKey: "user_id" })
Order.belongsTo(User, { foreignKey: "user_id" })

Order.hasMany(OrderProduct, { foreignKey: "order_id" })
OrderProduct.belongsTo(Order, { foreignKey: "order_id" })


const ProductPhoto = db.define("product_photo", {
    product_photo_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING },
    url: { type: DataTypes.STRING },
    product_id: { type: DataTypes.INTEGER, allowNull: false },
})

Product.hasMany(ProductPhoto, { foreignKey: "product_id" })
ProductPhoto.belongsTo(Product, { foreignKey: "product_id" })

const Enums = {
    "category": Category,
    "categories": Category,
    "sub_category": SubCategory,
    "sub_categories": SubCategory,
    "user": User,
    "users": User,
    "order": Order,
    "orders": Order,
    "order_product": OrderProduct,
    "order_products": OrderProduct,
    "product": Product,
    "products": Product,
    "product_photo": ProductPhoto,
    "product_photos": ProductPhoto
}

module.exports = {
    Enums,
    User,
    Order,
    OrderProduct,
    Category,
    Product,
    SubCategory,
    ProductPhoto
}


