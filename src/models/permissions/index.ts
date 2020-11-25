import {
    AllowNull,
    AutoIncrement,
    Column, CreatedAt, DataType, HasMany, Length, BelongsToMany,
    Model, PrimaryKey,
    Table, Unique, UpdatedAt
} from "sequelize-typescript"
import {RolePermission, RoleModel, UserRole} from "..";

@Table({
    tableName: 'permissions',
    indexes: [
        {
            fields: ['id']
        }
    ]
})

export class PermissionModel extends Model<PermissionModel> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number

    @Unique
    // co the null hay khong
    @AllowNull(false)
    @Length({max: 255})
    @Column
    name: string

    @AllowNull(true)
    @Length({max: 255})
    @Column
    description: string

    @CreatedAt
    @Column(DataType.DATE)
    created_at!: Date;

    @UpdatedAt
    @Column(DataType.DATE)
    updated_at!: Date;

    @HasMany(() => RolePermission, {constraints: false})
    roles_permissions: RolePermission[]

    @BelongsToMany(() => RoleModel, () => RolePermission)
    roles: RoleModel[]
}