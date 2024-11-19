---
layout: index
title: Pubs
---

# Pubs

Here are the pubs that have been visited:

[% for link in site.pubs %]
    <a href="[% link.value %]">[% link.key %]</a><br />
[% end %]
