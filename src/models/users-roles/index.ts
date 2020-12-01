import {
    AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, DataType, ForeignKey, HasMany,
    Model, PrimaryKey,
    Table, Unique, UpdatedAt
} from "sequelize-typescript";
import {
    UserModel,
    RoleModel
} from '..'
@Table({
    tableName: 'user_roles',
    indexes: [
        {
            fields: ['id']
        }
    ]
})

export class UserRoleModel extends Model<UserRoleModel> {
    @PrimaryKey
    @Unique
    @AllowNull(false)
    @AutoIncrement
    @Column
    id: number

    @ForeignKey(() => UserModel)
    @AllowNull(false)
    @Column
    user_id: number

    @ForeignKey(() => RoleModel)
    @AllowNull(false)
    @Column
    role_id: number

    @CreatedAt
    @Column(DataType.DATE)
    created_at!: Date;

    @UpdatedAt
    @Column(DataType.DATE)
    updated_at!: Date;

    // constraints: bo qua cac rang buoc giua cac model
    @BelongsTo(() => UserModel, {constraints: false})
    user: UserModel

    @BelongsTo(() => RoleModel, {constraints: false})
    role: RoleModel
}
