const db = require("../../db.js")
const { DataTypes } = require("sequelize")

const Company = db.define("company", {
    company_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING },
    photo: { type: DataTypes.STRING }
})

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
    company_id: { type: DataTypes.INTEGER, allowNull: false },
    available: { type: DataTypes.INTEGER, defaultValue: 0 }
})

Company.hasMany(Product, { foreignKey: "company_id" })
Product.belongsTo(Company, { foreignKey: "company_id" })

// Типы характеристик
const PropertyType = db.define("property_type", {
    property_type_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    type_name: { type: DataTypes.STRING },
    unit_type: { type: DataTypes.STRING }
})

const Property = db.define("property", {
    property_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING },
    property_type_id: { type: DataTypes.INTEGER, allowNull: false },
})

const ProductProperty = db.define("product_property", {
    product_property_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING },
    value: { type: DataTypes.BOOLEAN },
    value_min: { type: DataTypes.FLOAT },
    value_average: { type: DataTypes.FLOAT },
    value_max: { type: DataTypes.FLOAT },
    product_id: { type: DataTypes.INTEGER, allowNull: false },
    property_id: { type: DataTypes.INTEGER, allowNull: false }
})

PropertyType.hasMany(Property, { foreignKey: "property_type_id" })
Property.belongsTo(PropertyType, { foreignKey: "property_type_id" })

Property.hasMany(ProductProperty, { foreignKey: "property_id" })
ProductProperty.belongsTo(Property, { foreignKey: "property_id" })

Product.hasMany(ProductProperty, { foreignKey: "product_id" })
ProductProperty.belongsTo(Product, { foreignKey: "product_id" })

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

const Slider = db.define("slider", {
    slider_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING },
    text: { type: DataTypes.STRING, },
    photo_url: { type: DataTypes.STRING },
    product_id: { type: DataTypes.INTEGER, allowNull: true },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: false },
    start_active_dt: { type: DataTypes.DATE, allowNull: true },
    end_active_dt: { type: DataTypes.DATE, allowNull: true }
})

Product.hasOne(Slider, { foreignKey: "product_id" })
Slider.belongsTo(Product, { foreignKey: "product_id" })

Product.hasMany(ProductPhoto, { foreignKey: "product_id" })
ProductPhoto.belongsTo(Product, { foreignKey: "product_id" })

const Promo = db.define("promo", {
    promo_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING },
    text: { type: DataTypes.TEXT }
})

const PromoProduct = db.define("promo_product", {
    promo_id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
    product_id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
})

Promo.hasMany(PromoProduct, { foreignKey: "promo_id" })
PromoProduct.belongsTo(Promo, { foreignKey: "promo_id" })

Product.hasOne(PromoProduct, { foreignKey: "product_id" })
PromoProduct.belongsTo(Product, { foreignKey: "product_id" })

const ProductReview = db.define("product_review", {
    user_id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
    product_id: { type: DataTypes.INTEGER, allowNull: false, primaryKey: true },
    comment: { type: DataTypes.STRING },
    stars: { type: DataTypes.FLOAT, defaultValue: 0 }
})

Product.hasMany(ProductReview, { foreignKey: "product_id" })
ProductReview.belongsTo(Product, { foreignKey: "product_id" })

User.hasMany(ProductReview, { foreignKey: "user_id" })
ProductReview.belongsTo(User, { foreignKey: "user_id" })

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
    "product_photos": ProductPhoto,
    "sliders": Slider,
    "slider": Slider,
    "promos": Promo,
    "promo": Promo,
    "promo_products": PromoProduct,
    "promo_product": PromoProduct,

    "property_type": PropertyType,
    "property_types": PropertyType,

    "property": Property,
    "properties": Property,

    "product_property": ProductProperty,
    "product_properties": ProductProperty,

    "product_review": ProductReview,
    "product_reviews": ProductReview,

    "company": Company,
    "companies": Company

}

module.exports = {
    Enums,
    User,
    Order,
    OrderProduct,
    Category,
    Product,
    SubCategory,
    ProductPhoto,
    Slider, Promo,
    PromoProduct,
    PropertyType,
    Property,
    ProductProperty,
    ProductReview,
    Company
}


