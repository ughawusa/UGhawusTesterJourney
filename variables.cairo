//In cairo we have 3 different variables: Local, Sotrace and Global
//lets watch local variables first:
#[starknet::interface]
trait ILocalVariablesExample<TContractState> {
    fn do_something(self: @TContractState, value: u32) -> u32;
}

#[starknet::contract]
mod LocalVariablesExample {
    #[storage]
    struct Storage {}

    #[abi(embed_v0)]
    impl LocalVariablesExample of super::ILocalVariablesExample<ContractState> {
        fn do_something(self: @ContractState, value: u32) -> u32 {
            // This variable is local to the current block. It can't be accessed once it goes out of scope.
            let increment = 10;

            {
                // The scope of a code block allows for local variable declaration
                // We can access variables defined in higher scopes.
                let sum = value + increment;
                sum
            }
        }
    }
}

//Global:
#[starknet::interface]
trait IGlobalExample<TContractState> {
    fn foo(ref self: TContractState);
}
#[starknet::contract]
mod GlobalExample {
    // import the required functions from the starknet core library
    use starknet::get_caller_address;

    #[storage]
    struct Storage {}

    #[abi(embed_v0)]
    impl GlobalExampleImpl of super::IGlobalExample<ContractState> {
        fn foo(ref self: ContractState) {
            // Call the get_caller_address function to get the sender address
            let caller = get_caller_address();
        // ...
        }
    }
}

//and storage:
#[starknet::interface]
trait IStorageVariableExample<TContractState> {
    fn set(ref self: TContractState, value: u32);
    fn get(self: @TContractState) -> u32;
}
#[starknet::contract]
mod StorageVariablesExample {
    // All storage variables are contained in a struct called Storage
    // annotated with the `#[storage]` attribute
    #[storage]
    struct Storage {
        // Storage variable holding a number
        value: u32
    }

    #[abi(embed_v0)]
    impl StorageVariablesExample of super::IStorageVariableExample<ContractState> {
        // Write to storage variables by sending a transaction that calls an external function
        fn set(ref self: ContractState, value: u32) {
            self.value.write(value);
        }

        // Read from storage variables without sending transactions
        fn get(self: @ContractState) -> u32 {
            self.value.read()
        }
    }
}
