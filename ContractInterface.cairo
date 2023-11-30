#[starknet::interface]
trait IContract<TContractState> {
    /// High-level description of the function
    ///
    /// # Arguments
    /// * `arg_1` - Description of the argument
    /// * `arg_n` - ...
    ///
    /// # Returns
    /// High-level description of the return value
    fn do_something(ref self: TContractState, arg_1: T_arg_1) -> T_return;
}
