Namespace Mandelbrot;


(* Point of a Mandelbrot image.

   Author:  OrdinaSoft
            Patrick Lanz
            Lausanne
            info@ordinasoft.ch

   First version: March 25, 2019
*)


Interface


  Uses
    System.Drawing,

    OrdinaSoft.Aspects;

(*---------------------------------------------------------------------------------------------*)

  Type

    /// <summary>
    ///   Point of a <i>Mandelbrot</i> image.
    /// </summary>
    Point = Public Class

    Public

    {-- Constructor --}

      /// <summary>
      ///   Initializes a point.
      /// </summary>
      /// <param name="X">The X coordinate.</param>
      /// <param name="Y">The Y coordinate.</param>
      Constructor (X, Y : Double);

    {-- Properties --}

      /// <summary>
      ///   Gets or sets the color.
      /// </summary>
      /// <value>The color.</value>
      /// <remarks>
      ///   This property is not managed by the calculator.
      /// </remarks>
      [Aspect: OsProperty]
      Property Color : Color;

      /// <summary>
      ///   Gets the number of iterations.
      /// </summary>
      /// <value>The number of iterations.</value>
      /// <remarks>
      ///   If the calculation from the point diverges, this is the number of iteration before
      ///   divergence; otherwise, this is the maximum number of iterations.
      /// </remarks>
      [Aspect: OsProperty (FieldVisibility := 'Assembly')]
      Property NbIterations : Int32
        Read Assembly Write;

      /// <summary>
      ///   Gets the X coordinate.
      /// </summary>
      /// <value>The X coordinate.</value>
      [Aspect: OsProperty]
      Property X : Double
        Read Private Write;

      /// <summary>
      ///   Gets the Y coordinate.
      /// </summary>
      /// <value>The Y coordinate.</value>
      [Aspect: OsProperty]
      Property Y : Double
        Read Private Write;

    {-- Method --}

      /// <summary>
      ///   Returns a string representation of the point.
      /// </summary>
      /// <returns>The string representation.</returns>
      Method ToString : String;
        Override;

    End;

(*---------------------------------------------------------------------------------------------*)

Implementation

(*---------------------------------------------------------------------------------------------*)
(* Constructor. *)

  // <summary>
  //   Initializes a point.
  // </summary>
  // <param name="X">The X coordinate.</param>
  // <param name="Y">The Y coordinate.</param>

  Constructor Point (
    X,
    Y : Double
  );

  Begin
    _X := X;
    _Y := Y
  End;

(*---------------------------------------------------------------------------------------------*)
(* ToString. *)

  // <summary>
  //   Returns a string representation of the point.
  // </summary>
  // <returns>The string representation.</returns>

  Method Point.ToString
    : String;

  Begin
    Exit _NbIterations.ToString
  End;

(*---------------------------------------------------------------------------------------------*)

End.