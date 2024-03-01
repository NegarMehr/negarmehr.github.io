# Center align address below the picture 

In [/_sass/_base.scss](/_sass/_base.scss) `.profile`, `more-info`, add `text-align: center;`.

How to know to do this? In [/_layouts/about.liquid](/_layouts/about.liquid), we see in line 35 `<div class="more-info">{{ page.profile.more_info }}</div>`. Note that `page.profile.more_info` is provided in [/_pages/about.md](/_pages/about.md), we see `profile->more_info` where we have entered the address.