"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserRoleModel = void 0;
const sequelize_typescript_1 = require("sequelize-typescript");
const __1 = require("..");
let UserRoleModel = class UserRoleModel extends sequelize_typescript_1.Model {
};
__decorate([
    sequelize_typescript_1.PrimaryKey,
    sequelize_typescript_1.Unique,
    sequelize_typescript_1.AllowNull(false),
    sequelize_typescript_1.AutoIncrement,
    sequelize_typescript_1.Column,
    __metadata("design:type", Number)
], UserRoleModel.prototype, "id", void 0);
__decorate([
    sequelize_typescript_1.ForeignKey(() => __1.UserModel),
    sequelize_typescript_1.AllowNull(false),
    sequelize_typescript_1.Column,
    __metadata("design:type", Number)
], UserRoleModel.prototype, "user_id", void 0);
__decorate([
    sequelize_typescript_1.ForeignKey(() => __1.RoleModel),
    sequelize_typescript_1.AllowNull(false),
    sequelize_typescript_1.Column,
    __metadata("design:type", Number)
], UserRoleModel.prototype, "role_id", void 0);
__decorate([
    sequelize_typescript_1.CreatedAt,
    sequelize_typescript_1.Column(sequelize_typescript_1.DataType.DATE),
    __metadata("design:type", Date)
], UserRoleModel.prototype, "created_at", void 0);
__decorate([
    sequelize_typescript_1.UpdatedAt,
    sequelize_typescript_1.Column(sequelize_typescript_1.DataType.DATE),
    __metadata("design:type", Date)
], UserRoleModel.prototype, "updated_at", void 0);
__decorate([
    sequelize_typescript_1.BelongsTo(() => __1.UserModel, { constraints: false }),
    __metadata("design:type", __1.UserModel)
], UserRoleModel.prototype, "user", void 0);
__decorate([
    sequelize_typescript_1.BelongsTo(() => __1.RoleModel, { constraints: false }),
    __metadata("design:type", __1.RoleModel)
], UserRoleModel.prototype, "role", void 0);
UserRoleModel = __decorate([
    sequelize_typescript_1.Table({
        tableName: 'user_roles',
        indexes: [
            {
                fields: ['id']
            }
        ]
    })
], UserRoleModel);
exports.UserRoleModel = UserRoleModel;
