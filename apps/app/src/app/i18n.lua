local _M = {}

local mt = { __index = _M }

local trans_cn = {
    ["("] = "（",
    [")"] = "）",
    ["100% Powered by OpenResty and PostgreSQL"] = "100% 由 OpenResty 和 PostgreSQL 驱动",
    ["Bad search query"] = "非法的搜索查询",
    ["Contribute on GitHub"] = "贡献力量",
    ["Copyright © 2017, 2018, 2019, 2020, 2021, 2022 by Yichun Zhang (agentzh)"] = "版权所有 © 2017, 2018, 2019, 2020, 2021, 2022 章亦春 (agentzh)",
    ["More Interesting Topics"] = "更多有趣的文章",
    ["New blog post"] = "新博客文章",
    ["New!"] = "最新！",
    ["No query provided."] = "没有提供任何搜索词。",
    ["No search results found"] = "没有找到任何匹配的记录",
    ["Official Forum"] = "官方论坛",
    ["OpenResty&reg; - Official Site"] = "OpenResty&reg; - 中文官方站",
    ["OpenResty<sup>&reg;</sup> is a dynamic web platform based on NGINX and LuaJIT."] = "OpenResty<sup>&reg;</sup> 是一款基于 NGINX 和 LuaJIT 的 Web 平台。",
    ["OpenResty<sup>&reg;</sup> is a registered trademark owned by <a href=\"https://openresty.com/\">OpenResty Inc</a>."] = "OpenResty<sup>&reg;</sup> 是 <a href=\"https://openresty.com/\">OpenResty Inc</a> 公司所有的注册商标。",
    ["Please adjust your search query and try again."] = "请调整您的搜索查询并重试。",
    ["Query too long (more than %d bytes)."] = "查词太长了（已经超出 %d 字节）。",
    ["Scalable Web Platform by Extending NGINX with Lua"] = "通过 Lua 扩展 NGINX 实现的可伸缩的 Web 平台",
    ["Search OpenResty.org"] = "搜索 OpenResty.org 中文站",
    ["Search Result"] = "搜索结果",
    ["Timeline"] = "最近更新",
    ["Try OpenResty XRay"] = "试用 OpenResty XRay",
    ["Video Tutorials"] = "视频教程",
    ["is now released!"] = "已发布。",
    ["is published."] = "已发表。",
    ["view the source code of this site"] = "查看本站的源代码",
}
local translators = {
    ['en'] = function (s) return s end,
    ['cn'] = function (s) return trans_cn[s] or s end
}

function _M.new(lang)
    local translator = translators[lang]
    if not translator then
        return error("no translator found for language " .. tostring(lang))
    end
    return setmetatable({ translate = translator }, mt)
end

return _M
