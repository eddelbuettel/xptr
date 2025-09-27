

# Register a finalizer for external pointer.

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
an <code>externalptr</code> object
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="f">f</code>
</td>
<td>
an R function
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

## See Also

<code>reg.finalizer</code>
