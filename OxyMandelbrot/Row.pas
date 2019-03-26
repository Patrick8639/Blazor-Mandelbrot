Namespace Mandelbrot;


(* Row of a Mandelbrot image.

   Author:  OrdinaSoft
            Patrick Lanz
            Lausanne
            info@ordinasoft.ch

   First version: March 25, 2019
*)


Interface


  Uses
    OrdinaSoft.Aspects;

(*---------------------------------------------------------------------------------------------*)

  Type

    /// <summary>
    ///   Row of a <i>Mandelbrot</i> image.
    /// </summary>
    Row = Public Class
    
    Public

    {-- Constructor --}

      /// <summary>
      ///   Initialize a row.
      /// </summary>
      /// <param name="No">The number of the row.</param>
      /// <param name="NbPoints">The number of points in the row.</param>
      Constructor (No, NbPoints : Int32);

    {-- Properties --}

      /// <summary>
      ///   Gets the number of points in the row.
      /// </summary>
      /// <value>The number of points.</value>
      [Aspect: OsProperty]
      Property NbPoints : Int32
        Read Private Write;

      /// <summary>
      ///   Gets the number of the row.
      /// </summary>
      /// <value>The number.</value>
      [Aspect: OsProperty]
      Property No : Int32
        Read Private Write;

      /// <summary>
      ///   Gets the points.
      /// </summary>
      /// <value>The points.</value>
      /// <remarks>
      ///   The points are numbered starting at 0.
      /// </remarks>
      [Aspect: OsProperty]
      Property Points : Array Of Point
        Read Private Write;

    End;

(*---------------------------------------------------------------------------------------------*)

Implementation

(*---------------------------------------------------------------------------------------------*)
(* Constructor. *)

  // <summary>
  //   Initialize a row.
  // </summary>
  // <param name="No">The number of the row.</param>
  // <param name="NbPoints">The number of points in the row.</param>

  Constructor Row (
    No,
    NbPoints : Int32
  );

  Begin
    _NbPoints := NbPoints;
    _No       := No;
    _Points   := New Point [NbPoints]
  End;

(*---------------------------------------------------------------------------------------------*)

End.