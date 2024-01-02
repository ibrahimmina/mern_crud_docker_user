const mongoose = require("mongoose");
mongoose.set("debug", true);
const Schema = mongoose.Schema;
let userSchema = new Schema(
  {
    name: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },
    UserConfig: [
      {
        Annual_Bank_Rate: mongoose.Types.Decimal128,
        Min_Order_Lifetime: mongoose.Types.Decimal128,
        ROI: mongoose.Types.Decimal128,
        Risk: mongoose.Types.Decimal128,
      },
    ],
  },
  {
    timestamps: true,
    collection: "users",
  }
);
module.exports = mongoose.model("User", userSchema);
