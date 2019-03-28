Namespace Mandelbrot;


(* The parameters for a Mandelbrot image.

   Author:  OrdinaSoft
            Patrick Lanz
            Lausanne
            info@ordinasoft.ch

   First version: March 25, 2019
*)


Interface


(*---------------------------------------------------------------------------------------------*)

  Type

    /// <summary>
    ///   The parameters for a <i>Mandelbrot</i> image.
    /// </summary>
    ImageParameters = Public Class

    Public

    {-- Constructor --}

      /// <summary>
      ///   Initializes an instance of the parameters.
      /// </summary>
      /// <remarks>
      ///   The <see cref="Left" />, <see cref="Top" />, <see cref="Right" /> and
      ///   <see cref="Bottom" /> properties are initialized to calculate the full set, from
      ///   -2.25 to 0.75 horizontally and from -1.5 to 1.5 vertically. The
      ///   <see cref="MaxNbIterations">maximum number of iterations</see> is set to 256. The
      ///   <see cref="EscapeRadius">escape radius</see> is set to 2.0.
      /// </remarks>
      Constructor;

    {-- Properties --}

      /// <summary>
      ///  Gets or sets a value that indicates whether the calculation must be aborted.
      /// </summary>
      /// <value>
      ///   <b>true</b> if the calculation must be aborted;<br />
      ///   otherwise, <b>false</b>.
      /// </value>
      /// <remarks>
      ///   Setting this value to <b>true</b> aborts the calculation.
      /// </remarks>
      Property Abort : Boolean;

      /// <summary>
      ///   Gets or sets the bottomtmost coordinate of the image.
      /// </summary>
      /// <value>The bottomtmost coordinate.</value>
      Property Bottom : Double;

      /// <summary>
      ///   Gets or sets the escape radius.
      /// </summary>
      /// <value>The escape radius.</value>
      /// <remarks>
      ///   When the absolute value of the calculated value is greater than or equal to this
      ///   value, the calculation is stopped.
      /// </remarks>
      Property EscapeRadius : Double;

      /// <summary>
      ///   Gets or sets the leftmost coordinate of the image.
      /// </summary>
      /// <value>The leftmost coordinate.</value>
      Property Left : Double;

      /// <summary>
      ///   The maximum number of iterations before the point is set to not be divergent.
      /// </summary>
      /// <value>The maximum number of iterations.</value>
      /// <remarks>
      ///   The calculator will stop iterations when this value is reached.
      /// </remarks>
      Property MaxNbIterations : Int32;

      /// <summary>
      ///   Gets or sets the number of columns. 
      /// </summary>
      /// <value>The number of columns.</value>
      Property NbColumns : Int32;

      /// <summary>
      ///   Gets or sets the number of rows. 
      /// </summary>
      /// <value>The number of rows.</value>
      Property NbRows : Int32;

      /// <summary>
      ///   Gets or sets the rightmost coordinate of the image.
      /// </summary>
      /// <value>The rightmost coordinate.</value>
      Property Right : Double;

      /// <summary>
      ///   Gets or sets the topmost coordinate of the image.
      /// </summary>
      /// <value>The topmost coordinate.</value>
      Property Top : Double;

    {-- Method --}

      /// <summary>
      ///   Checks the validity of the parameters.
      /// </summary>
      /// <returns>
      ///   <b>null</b> if no error was found;<br />
      ///   otherwise, a message 
      /// </returns>
      Method CheckValidity : String;

    End;

(*---------------------------------------------------------------------------------------------*)

Implementation

(*---------------------------------------------------------------------------------------------*)
(* Constructor. *)

  // <summary>
  //   Initializes an instance of the parameters.
  // </summary>
  // <remarks>
  //   The <see cref="Left" />, <see cref="Top" />, <see cref="Right" /> and
  //   <see cref="Bottom" /> properties are initialized to calculate the full set, from
  //   -2.25 to 0.75 horizontally and from -1.5 to 1.5 vertically.
  // </remarks>

  Constructor ImageParameters;

  Begin
    Left            :=  -2.25;
    Right           :=   0.75;
    Bottom          :=  -1.50;
    Top             :=   1.50;
    MaxNbIterations := 256;
    EscapeRadius    :=   2.0
  End;

(*---------------------------------------------------------------------------------------------*)
(* Checking the parameters. *)

  // <summary>
  //   Checks the validity of the parameters.
  // </summary>

  Method ImageParameters.CheckValidity
    : String;

  Begin
    Exit Nil
  End;

(*---------------------------------------------------------------------------------------------*)

End.