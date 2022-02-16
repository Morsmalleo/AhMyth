declare module "gulp-concat-filenames" {

  import { Duplex } from 'stream';

  interface IConcatFilenameOptions {
    // The character to use in place of '\n'' for a newline. The default value will be '\n'
    newline?: string;
    // Some text to prepend to every entry in the list of filenames
    prepend?: string;
    // Some text to append to every intry in the list of filenames
    append?: string;
    // A function that takes one parameter (the file name) and returns the string after some formatting. Can be used in addition to, or instead of, append and prepend
    template?: (filename: string) => string;
    // the root folder. Including this argument will return a list of relative paths instead of absolute paths.
    root?: string;
  }

  export default function concatFilenames(filename: string, options: IConcatFilenameOptions): Duplex;
}
