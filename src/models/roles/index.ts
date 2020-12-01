import {
    AllowNull,
    AutoIncrement, BelongsToMany, Column, CreatedAt, DataType, HasMany, Length,
    Model, PrimaryKey,
    Table, Unique, UpdatedAt
} from "sequelize-typescript";
import {
    UserRoleModel,
    RolePermission, PermissionModel, UserModel
} from '..'
@Table({
    tableName: 'roles',
    indexes: [
        {
            fields: ['id']
        }
    ]
})

export class RoleModel extends Model<RoleModel> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number

    @Unique
    @Length({max: 255})
    @AllowNull(false)
    @Column
    name: string

    @Length({max: 255})
    @AllowNull(true)
    @Column
    description: string;

    @CreatedAt
    @Column(DataType.DATE)
    created_at!: Date;

    @UpdatedAt
    @Column(DataType.DATE)
    updated_at!: Date;

    //constraints: bo qua cac rang buoc giua cac model
    @HasMany(() => UserRoleModel, {constraints: false})
    user_roles: UserRoleModel[]
    @BelongsToMany(() => UserModel, () => UserRoleModel)
    users: UserModel[]

    @HasMany(() => RolePermission, {constraints: false})
    roles_permissions: RolePermission[]

    @BelongsToMany(() => PermissionModel, () => RolePermission)
    permissions: PermissionModel[]
}
