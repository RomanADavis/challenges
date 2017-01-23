# The exercise today asks you to validate a telephone number, as if written on
an input form. Telephone numbers can be written as ten digits, or with dashes,
spaces, or dots between the three segments, or with the area code parenthesized;
both the area code and any white space between segments are optional.
#
# Thus, all of the following are valid telephone numbers: 1234567890,
# 123-456-7890, 123.456.7890, (123)456-7890, (123) 456-7890 (note the white space
# following the area code), and 456-7890.
#
# The following are not valid telephone numbers: 123-45-6789, 123:4567890, and
# 123/456-7890.
#
# source: programmingpraxis.com

regex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/

puts ARGV.first ~= regex ? "valid number" : "invalid number"
