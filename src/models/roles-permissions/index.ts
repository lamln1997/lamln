import {
    AllowNull,
    AutoIncrement, BelongsTo,
    Column,
    CreatedAt, DataType, ForeignKey,
    Model, PrimaryKey,
    Table, UpdatedAt
} from "sequelize-typescript";
import {
    PermissionModel,
    RoleModel
} from  '..'
@Table({
    tableName: 'roles_permissions',
    indexes: [
        {
            fields: ['id']
        }
    ]
})
export class RolePermission extends Model<RolePermission> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number

    @ForeignKey(() => RoleModel)
    @AllowNull(false)
    @Column
    role_id: number

    @ForeignKey(() => PermissionModel)
    @AllowNull(false)
    @Column
    permission_id: number

    @CreatedAt
    @Column(DataType.DATE)
    created_at!: Date;

    @UpdatedAt
    @Column(DataType.DATE)
    updated_at!: Date;

    @BelongsTo(() => RoleModel, {constraints: false})
    role: RoleModel

    @BelongsTo(() => PermissionModel,  {constraints: false})
    permission: PermissionModel
}