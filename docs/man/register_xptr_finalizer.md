

# Register a finalizer for external pointer.

[**Source code**](https://github.com/eddelbuettel/xptr//tree/master/R/#L)

## Description

Register a finalizer for external pointer.

## Usage

<pre><code class='language-R'>register_xptr_finalizer(s, f, onexit = FALSE)
</code></pre>

## Arguments

<table role="presentation">
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="s">s</code>
</td>
<td>
An <code>externalptr</code> object
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="f">f</code>
</td>
<td>
An R function
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="onexit">onexit</code>
</td>
<td>
should the finalizer execute on exit?
</td>
</tr>
</table>

## Value

No return value as the function is called for its side effect

## See Also

<code>reg.finalizer</code>
