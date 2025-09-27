

# Create an external pointer object.

[**Source code**](https://github.com/eddelbuettel/xptr//tree/master/R/#L)

## Description

Create an external pointer object.

## Usage

<pre><code class='language-R'>new_xptr(address = "", tag = NULL, protected = NULL)

null_xptr(tag = NULL, protected = NULL)
</code></pre>

## Arguments

<table role="presentation">
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="address">address</code>
</td>
<td>
a string of pointer address
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="tag">tag</code>
</td>
<td>
an optional tag
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="protected">protected</code>
</td>
<td>
an objected to be protected from gc within the lifetime of the external
pointer
</td>
</tr>
</table>

## Value

an <code>externalptr</code> object
