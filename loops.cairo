//example of a loop 
//Loop: block of code that will run repetitively until a condition makes it stop

    let mut arr = ArrayTrait::new();

    // Same as ~ while (i < 10) arr.append(i++);
    let mut i: u32 = 0;
    let limit = 10;
    loop {
        if i == limit {
            break;
        };

        arr.append(i);

        i += 1;
    };
