namespace Test;

  uses
    Mandelbrot;

  type
    Program = class
    public

      class method Main(args: array of String): Int32;
      begin
        var Parameters := new ImageParameters (
                                MaxNbIterations :=  256,
                                NbColumns       := 2560,
                                NbRows          := 1440);

        var Calculator := new Calculator (Parameters);
        Calculator.Calculate;
        Console.WriteLine ('Finished!: ' + Calculator.Duration.ToString);
        Console.ReadKey
      end;

  end;

end.