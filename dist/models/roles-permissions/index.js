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
exports.RolePermission = void 0;
const sequelize_typescript_1 = require("sequelize-typescript");
const __1 = require("..");
let RolePermission = class RolePermission extends sequelize_typescript_1.Model {
};
__decorate([
    sequelize_typescript_1.PrimaryKey,
    sequelize_typescript_1.AutoIncrement,
    sequelize_typescript_1.Column,
    __metadata("design:type", Number)
], RolePermission.prototype, "id", void 0);
__decorate([
    sequelize_typescript_1.ForeignKey(() => __1.RoleModel),
    sequelize_typescript_1.AllowNull(false),
    sequelize_typescript_1.Column,
    __metadata("design:type", Number)
], RolePermission.prototype, "role_id", void 0);
__decorate([
    sequelize_typescript_1.ForeignKey(() => __1.PermissionModel),
    sequelize_typescript_1.AllowNull(false),
    sequelize_typescript_1.Column,
    __metadata("design:type", Number)
], RolePermission.prototype, "permission_id", void 0);
__decorate([
    sequelize_typescript_1.CreatedAt,
    sequelize_typescript_1.Column(sequelize_typescript_1.DataType.DATE),
    __metadata("design:type", Date)
], RolePermission.prototype, "created_at", void 0);
__decorate([
    sequelize_typescript_1.UpdatedAt,
    sequelize_typescript_1.Column(sequelize_typescript_1.DataType.DATE),
    __metadata("design:type", Date)
], RolePermission.prototype, "updated_at", void 0);
__decorate([
    sequelize_typescript_1.BelongsTo(() => __1.RoleModel, { constraints: false }),
    __metadata("design:type", __1.RoleModel)
], RolePermission.prototype, "role", void 0);
__decorate([
    sequelize_typescript_1.BelongsTo(() => __1.PermissionModel, { constraints: false }),
    __metadata("design:type", __1.PermissionModel)
], RolePermission.prototype, "permission", void 0);
RolePermission = __decorate([
    sequelize_typescript_1.Table({
        tableName: 'roles_permissions',
        indexes: [
            {
                fields: ['id']
            }
        ]
    })
], RolePermission);
exports.RolePermission = RolePermission;
