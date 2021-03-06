﻿Namespace Mandelbrot;


(* Calculator for a Mandelbrot image.

   Author:  OrdinaSoft
            Patrick Lanz
            Lausanne
            info@ordinasoft.ch

   First version: March 25, 2019
*)


Interface


  Uses
    System.Diagnostics,
    System.Numerics,

    OrdinaSoft.Aspects;

(*---------------------------------------------------------------------------------------------*)

  Type

    /// <summary>
    ///   Calculator for a <i>Mandelbrot</i> image.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     Changing the parameters after the calculation has started can lead to unexpected
    ///     results.
    ///   </para>
    ///   <para>
    ///     Setting the <see cref="ImageParameters.Abort">Abort</see> property of the
    ///     parameters to <b>true</b> will abort the calculations. As the property is not checked
    ///     continuaously, there can be a delay between the setting and the calculation abort.
    ///   </para>
    /// </remarks>
    Calculator = Public Class

    Public

    {-- Constructor --}

      /// <summary>
      ///   Initializes an instance of the calculator.
      /// </summary>
      /// <param name="Parameters">The parameters.</param>
      /// <exception cref="ArgumentNullException">
      ///   <paramref name="Parameters" /> is <b>null</b>.
      /// </exception>
      /// <remarks>
      ///   Changing the parameters after the calculation has started can lead to unexpected
      ///   results.
      /// </remarks>
      Constructor (Parameters : ImageParameters);

    {-- Properties --}

      /// <summary>
      ///   Gets the duration.
      /// </summary>
      /// <value>The duration.</value>
      [Aspect: OsProperty]
      Property Duration : TimeSpan
        Read Private Write;

      /// <summary>
      ///   Gets or sets the parameters for the image.
      /// </summary>
      /// <value>The parameters.</value>
      /// <remarks>
      ///   <para>
      ///     Changing the parameters after the calculation has started can lead to unexpected
      ///     results.
      ///   </para>
      ///   <para>
      ///     Setting the <see cref="ImageParameters.Abort">Abort</see> property of the
      ///     parameters to <b>true</b> will abort the calculations.
      ///   </para>
      /// </remarks>
      [Aspect: OsProperty]
      Property Parameters : ImageParameters;

      /// <summary>
      ///   Gets the rows.
      /// </summary>
      /// <value>The rows.</value>
      /// <remarks>
      ///   The rows are numbered starting at 0.
      /// </remarks>
      [Aspect: OsProperty]
      Property Rows : Array Of Row
        Read Private Write;

    {-- Method --}

      /// <summary>
      ///   Calculates the image.
      /// </summary>
      /// <remarks>
      ///   We can use the <i>Complex</i> to make the calculations, but it is slower than just
      ///   using <i>Double</i>.<br />
      ///   The tests done on March 26, 2019, using a Core i9 9900K and 32GB of RAM, gives the
      ///   following score:
      ///   <list type="bullet">
      ///     <item><b>Using Complex type</b>: 13.68s.</item>
      ///     <item><b>Using Double type</b>: 9.22s</item>
      ///   </list><br />
      ///   The result is certainly the consequence of making method calls and the additional
      ///   tests made by the .NET framework.<br />
      ///   The test was made with the full set, a maximum of 256 iterations, 10'000 points both
      ///   horizontally and vertically, so a total of 100'000'000 points calculated.
      /// </remarks>
      Method Calculate;

    End;

(*---------------------------------------------------------------------------------------------*)

Implementation

(*---------------------------------------------------------------------------------------------*)
(* Constructor. *)

  // <summary>
  //   Initializes an instance of the calculator.
  // </summary>
  // <param name="Parameters">The parameters.</param>
  // <exception cref="ArgumentNullException">
  //   <paramref name="Parameters" /> is <b>null</b>.
  // </exception>
  // <remarks>
  //   Changing the parameters after the calculation has started can lead to unexpected
  //   results.
  // </remarks>

  Constructor Calculator (
    Parameters : ImageParameters
  );

  Begin
    If Not Assigned (Parameters) Then
      Raise New ArgumentNullException (NameOf (Parameters));

    _Parameters := Parameters
  End;

(*---------------------------------------------------------------------------------------------*)
(* Calculation. *)

  // <summary>
  //   Calculates the image.
  // </summary>
  // <remarks>
  //   We can use the <i>Complex</i> to make the calculations, but it is slower than just
  //   using <i>Double</i>.<br />
  //   The tests done on March 26, 2019, using a Core i9 9900K and 32GB of RAM, gives the
  //   following score:
  //   <list type="bullet">
  //     <item><b>Using Complex type</b>: 13.68s.</item>
  //     <item><b>Using Double type</b>: 9.22s</item>
  //   </list><br />
  //   The result is certainly the consequence of making method calls and the additional
  //   tests made by the .NET framework.<br />
  //   The test was made with the full set, a maximum of 256 iterations, 10'000 points both
  //   horizontally and vertically, so a total of 100'000'000 points calculated.
  // </remarks>

  Method Calculator.Calculate;

  Begin
    Var Stopwatch := New Stopwatch;
    Stopwatch.Start;

    Var MaxNbIter := Parameters.MaxNbIterations;
    Var NbColumns := Parameters.NbColumns;
    Var MaxNoCol  := NbColumns - 1;
    Var MaxValue  := Parameters.EscapeRadius * Parameters.EscapeRadius;
    Var Left      := Parameters.Left;
    Var Bottom    := Parameters.Bottom;
    Var XInc      := (Parameters.Right - Left  ) / MaxNoCol;
    Var YInc      := (Parameters.Top   - Bottom) / MaxNoCol;
    Var Rows      := New Row [Parameters.NbRows];
    Self.Rows     := Rows;

    For Parallel ixRow : Int32 := 0 To Rows.Length - 1 Do Begin
      Var Row      := New Row (ixRow, NbColumns);
      Rows [ixRow] := Row;
      Var Points   := Row.Points;
      Var Y        := Bottom + (ixRow * YInc);
      Var X        := Left;

      For ixCol : Int32 := 0 To MaxNoCol Do Begin
        Var NbIter  := 0;       // Number of iterations
        Var Real    := X;       // Real part of current value
        Var Imag    := Y;       // Imaginary part of current value
        Var RealSqr :  Double;  // Square of Real
        Var ImagSqr :  Double;  // Square of Imag

        Loop Begin
          RealSqr := Real * Real;
          ImagSqr := Imag * Imag;

          If RealSqr + ImagSqr >= MaxValue Then
            Break;

          Imag := (2 * Real * Imag) + Y;
          Real := RealSqr - ImagSqr + X;

          Inc (NbIter);
          If NbIter >= MaxNbIter Then
            Break
        End;

        Points [ixCol] := New Point (X, Y,
                                     NbIterations := NbIter);

        X := X + XInc
      End

    End;


    Stopwatch.Stop;
    _Duration := Stopwatch.Elapsed
  End;

(*---------------------------------------------------------------------------------------------*)

End.