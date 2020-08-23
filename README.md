# International Scheme

The purpose of this project is to translate the Scheme programming language to every human language.

## Background

Scheme is a powerful programming language.  How powerful?  So powerful that you can translate most of Scheme into other _human_ languages within Scheme _itself_.  So powerful that you can incorporate these translations into your Scheme programs as _libraries_ that you can mix and combine to write multilingual programs.  So powerful that not only _can_ you do all that, but you can do it more easily than you might have ever thought possible.  By using two convenient abstractions defined in this library, you too can bring the power of Scheme to your language and experience the joy of expressing your ideas directly in the language of your thoughts.

## How can I translate Scheme to my language?

Two macros are defined in `international.scm`: `translate-procedure-names` and `translate-syntax-names`.

* The `translate-procedure-names` macro is used to translate all the procedure names.
* The `translate-syntax-names` macro is used to translate all the syntax names.

Use `languages/template.scm` as a starting point for translations to your language.

To translate Scheme to your language, simply replace each `todo` in the template with a translation of the identifier to its left.

For a list of identifier definitions, please see https://www.scheme.com/tspl4/summary.html

## Where can I see an example of an existing translation?

Please see `languages/bosanski.scm` for a translation of R6RS Scheme into Bosnian.

Below is a version of a "Hello, World!" (lit. "Healthy, World!") program in Scheme written in Bosnian.

```
(definiši (zdravo-svjete)
  (prikaži "Zdravo, Svjete!"))
```

## Why is the example translation in Bosnian?

Because Bosnian is a language that the author of this library speaks well enough to translate.

## How can I write Scheme code in my language?

When you have created a translation file, simply import it into your project and write Scheme code in your language.

## How can I contribute a translation?

Please feel free to contribute PRs of new translations of Scheme to your language as well as corrections to existing translations.

## Are there parts of Scheme that cannot be translated using this library?

Yes, there are a few parts of Scheme that cannot be translated using this library.

For example:

* Existing error messages are not translated.
* Self-evaluating constants are not translated. (e.g. `#t`, `#f`, `#\c`, 12.3, "abc")
* Condition type names are not translated. (e.g. &condition, &who, &no-nans, etc.)

## Is there anything else I should know about this library?

Yes, the translation of auxiliary keywords is not hygienic.

Here's an example of using the `translate-syntax-names` macro to translate the name of `cond`:

```
(translate-syntax-names cond uslov (else inače))
```

In addition to translating `cond` to `uslov`, this will also translates the auxiliary keyword `else` (which is internal to `cond`) to `inače`.  However, _all_ identifiers named `else` within `uslov` will be renamed to `inače`, even ones not in the expected position of the auxiliary keyword `else` as defined by `cond`.  This can cause some unexpected behaviour, such as the following:

```
(uslov (#t (let ((else "this is not hygienic")) (display inače))))
```

Since the expected positions of auxiliary keywords are not known outside the definition of a macro, the only way to translate `cond` to `uslov` hygienically while also translating `else` to `inače` would be to re-implement `cond` and name it `uslov`.

Unfortunately, this may be a more difficult task for some forms, such as the `library` form.


## License

This project is licensed under the Apache-2.0 License.


Made in Canada with :heart:
