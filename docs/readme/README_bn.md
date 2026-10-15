<div align="center">

[English](../../README.md) · [简体中文](README_zh.md) · [繁體中文](README_zh-TW.md) · [日本語](README_ja.md) · [한국어](README_ko.md) · [Türkçe](README_tr.md) · [Русский](README_ru.md) · [Tiếng Việt](README_vi.md) · [ไทย](README_th.md) · [Deutsch](README_de.md) · [Español](README_es.md) · [Français](README_fr.md) · [Українська](README_uk.md) · [Polski](README_pl.md) · [Português (Brasil)](README_pt-BR.md) · [العربية](README_ar.md) · [فارسی](README_fa.md) · [Bahasa Indonesia](README_id.md) · [Italiano](README_it.md)
· [Ελληνικά](README_el.md) · **বাংলা**

# REA: যেকোনো কিছু রিভার্স ইঞ্জিনিয়ার করুন

### একটি মাত্র MCP দিয়ে বাইনারি, অ্যাপ্লিকেশন ও রানটাইম আচরণ রিভার্স ইঞ্জিনিয়ার করুন।

**কোনো অ্যাপে পছন্দের একটি ফিচার খুঁজে পেয়েছেন? বাইনারি স্তর পর্যন্ত এর কার্যপ্রণালী বুঝে নিন।**

[![npm version](https://img.shields.io/npm/v/rea-agents?style=flat-square&color=cb3837)](https://www.npmjs.com/package/rea-agents)
[![MCP tool catalog](https://img.shields.io/badge/MCP-tool_catalog-5c4ee5?style=flat-square)](../mcp-contracts.md#generated-catalog)
[![Node.js requirements](https://img.shields.io/badge/Node.js-requirements-339933?style=flat-square&logo=nodedotjs&logoColor=white)](#current-status)
[![skills.sh](https://skills.sh/b/morluto/rea?style=flat-square)](https://skills.sh/morluto/rea/reverse-engineer-anything)
[![MIT license](https://img.shields.io/badge/license-MIT-f4c430?style=flat-square)](../../LICENSE)
[![Discord](https://img.shields.io/discord/1556595354999332884?logo=discord&logoColor=white&label=Discord&color=5865F2)](https://discord.gg/GkcryMnJDM)

<a href="https://trendshift.io/repositories/82054?utm_source=repository-badge&amp;utm_medium=badge&amp;utm_campaign=badge-repository-82054" target="_blank" rel="noopener noreferrer"><img src="https://trendshift.io/api/badge/repositories/82054" alt="morluto%2Frea | Trendshift" width="250" height="55"/></a>

**[ওয়েবসাইট](https://rea.tools/) · [গাইড](https://rea.tools/guides/) · [শোকেস](https://rea.tools/showcase/)**

[দ্রুত শুরু](#দ্রুত-শুরু) · [REA কীভাবে কাজ করে](#rea-কীভাবে-কাজ-করে) · [কী কী বিশ্লেষণ করা যায়](#কী-কী-বিশ্লেষণ-করা-যায়) · [শোকেস](#শোকেস) · [প্রায়শই জিজ্ঞাসিত প্রশ্ন](#প্রায়শই-জিজ্ঞাসিত-প্রশ্ন) · [ডকুমেন্টেশন](#ডকুমেন্টেশন)

<code>npx rea-agents setup</code>

</div>

> [!IMPORTANT]
> REA-এর অফিসিয়াল উৎস: [morluto/rea](https://github.com/morluto/rea), [rea.tools](https://rea.tools/), [rea-agents](https://www.npmjs.com/package/rea-agents) (npm)।
> এই অফিসিয়াল উৎস থেকে প্রদত্ত ইনস্টলেশন ও রিলিজ লিংক ব্যবহার করুন। একই নামের রিপোজিটরি বা কপি করা README দেখে অফিসিয়াল ডিস্ট্রিবিউশন ফাইল যাচাই করা সম্ভব নয়।

<div align="center">

<br />

<img src="../assets/rea-hopper-analysis.png" alt="REA Hopper-এর মধ্যে অ্যানালাইসিস ব্রিজ চালিয়ে নেটিভ বাইনারি পরীক্ষা করছে" width="1200" />

<br /><br />

<table aria-label="REA কমিউনিটি">
<tr>
<td align="center" width="360">
  <a href="https://discord.gg/GkcryMnJDM">
    <img src="../assets/discord.svg" height="42" alt="Discord" /><br />
    <strong>রিভার্স ইঞ্জিনিয়ারিং কমিউনিটিতে যোগ দিন</strong>
  </a><br />
  <sub>Discord · প্রশ্ন ও উত্তর · ফলাফল শেয়ার</sub>
</td>
</tr>
</table>

<br />

</div>

---

কোনো অ্যাপে এমন একটি ফিচার দেখেছেন যা আপনি নিজের প্রোডাক্টেও চান? আপনার এজেন্টকে বলুন REA দিয়ে তদন্ত করতে। সোর্স কোড ছাড়াই অ্যাপ পরীক্ষা করা, ফিচারের কার্যপ্রণালী ব্যাখ্যা করা, প্রমাণ দেখানো এবং আপনার প্রজেক্টে অনুরূপ ফিচার বাস্তবায়ন করা সম্ভব।

REA এজেন্টকে বিশ্লেষণ সরঞ্জামের সাথে সংযুক্ত করে নেটিভ বাইনারি, JavaScript ও Electron অ্যাপ, .NET অ্যাসেম্বলি এবং ওয়েবসাইট পরীক্ষা করতে সক্ষম করে। টার্মিনালেও একই সরঞ্জাম ব্যবহার করা যায়। বিশ্লেষণ স্থানীয়ভাবে চলে এবং ফলাফলে প্রতিটি সিদ্ধান্তের প্রমাণ ও সীমাবদ্ধতা অন্তর্ভুক্ত থাকে।

সেটআপ প্রক্রিয়া আপনার এজেন্টে REA নিবন্ধন করে এবং সংস্করণ-নির্দিষ্ট ওয়ার্কফ্লো নির্দেশনা ইনস্টল করে। নেটিভ বিশ্লেষণের জন্য আপনার বিদ্যমান Hopper, Ghidra বা IDA ইনস্টলেশন ব্যবহার করা যায়। অনুমোদন দিলে সেটআপ প্রক্রিয়া Hopper ইনস্টলও করতে পারে। স্ট্যাটিক JavaScript বিশ্লেষণে কোনো নেটিভ অ্যানালাইসিস ইঞ্জিনের প্রয়োজন নেই।

> **[REA ওয়েবসাইট](https://rea.tools/)**-এ সেটআপ পদ্ধতি, চিত্রসহ গাইড এবং বাস্তব উদাহরণ দেখুন।

## দ্রুত শুরু

Linux-এ Ghidra, JADX, ফার্মওয়্যার টুল চালাতে বা স্ট্যাটিক JavaScript/Electron বিশ্লেষণ করতে, প্রসেস মালিকানা যাচাইয়ের জন্য REA-এর `PATH`-এ procps-সামঞ্জস্যপূর্ণ `ps` থাকতে হবে। সমাধান `docs/installation.md`-এর "Linux owned-process prerequisite" অংশে আছে।

### এজেন্ট সেটআপ

Node.js ও npm ইনস্টল থাকলে নিচের কমান্ড চালান।

```bash
npx rea-agents setup
```

এজেন্ট নির্বাচন করুন, প্রস্তাবিত পরিবর্তন পর্যালোচনা করুন ও অনুমোদন দিন। সেটআপ প্রক্রিয়া বিদ্যমান কনফিগারেশন ব্যাকআপ করে এবং REA-এর MCP সার্ভার ও সংস্করণ-নির্দিষ্ট ওয়ার্কফ্লো নির্দেশনা যোগ করে। সম্পন্ন হলে এজেন্ট পুনরায় চালু করুন।

সেটআপ Claude Code, Codex, Cursor, Gemini CLI, Grok Build এবং [অন্যান্য এজেন্ট](../installation.md#supported-agents) সমর্থন করে। প্রোভাইডার কনফিগারেশন ও ম্যানুয়াল MCP নিবন্ধনের জন্য [ইনস্টলেশন ও সেটআপ](../installation.md) দেখুন।

### এজেন্টকে অনুরোধ করুন

```text
Notes অ্যাপের সার্চ ফিচার কীভাবে কাজ করে তা তদন্ত করুন, প্রমাণ দেখান, তারপর আমার প্রজেক্টে অনুরূপ ফিচার বাস্তবায়ন করুন।
```

Notes-এর জায়গায় আপনার টার্গেট অ্যাপ বসান এবং কোন ফিচার বুঝতে চান তা উল্লেখ করুন।

### টার্মিনাল ব্যবহার

আনপ্যাক করা JavaScript/Electron অ্যাপ ডিরেক্টরি বা ASAR পরীক্ষা করুন।

```bash
npx -y rea-agents@latest analyze-javascript-application /absolute/path/to/app --json
```

ফলাফলে মডিউল, ইম্পোর্ট, Electron সীমানা ও সংশ্লিষ্ট প্রমাণ অন্তর্ভুক্ত থাকে। পাথটি আপনার বিশ্লেষণের লক্ষ্যবস্তু দিয়ে প্রতিস্থাপন করুন। Windows-এ `"D:/apps/example"` ধরনের পাথ ব্যবহার করা যায়।

নিয়মিত ব্যবহার করলে `rea` কমান্ড ইনস্টল করুন।

```bash
npm install --global rea-agents
rea --help
```

নেটিভ বিশ্লেষণের জন্য প্রথমে প্রোভাইডার সেটআপ করতে হবে। নেটিভ কমান্ড, প্রোভাইডার নির্বাচন, স্ন্যাপশট, স্ক্রিপ্ট ব্যবহারের জন্য [CLI ও Evidence গাইড](../cli.md) দেখুন।

### REA আপডেট

REA দ্রুত পরিবর্তিত হয় এবং নতুন রিলিজে প্রায়ই বাগ ফিক্স থাকে। ইনস্টল করা সংস্করণ সর্বশেষ সংস্করণে রাখুন।

`npm install --global` বা `bun add --global` দিয়ে ইনস্টল করা CLI-তে নিচের কমান্ড ব্যবহার করুন।

```bash
rea update
```

Bun গ্লোবাল আপডেটের জন্য Bun 1.2.17 বা তার পরের সংস্করণ প্রয়োজন। পুরনো Bun ব্যবহার করলে `rea update` চালানোর আগে Bun আপগ্রেড করুন।

এজেন্ট নিবন্ধন ও স্কিল আপডেট করতে আপডেট প্রক্রিয়ায় প্রদর্শিত সেটআপ কমান্ড চালান।

`npx` ব্যবহার করলে নিচের কমান্ডে এজেন্ট সেটআপ আপডেট করুন।

```bash
npx rea-agents@latest setup
```

সেটআপ পরিবর্তন পর্যালোচনা করুন ও এজেন্ট পুনরায় চালু করুন। এককালীন CLI কাজের জন্য `npx rea-agents@latest`-এর পরে প্রয়োজনীয় কমান্ড যোগ করে চালান। Bun ব্যবহার করলে উপরের কমান্ডে `npx rea-agents@latest`-কে `bunx rea-agents@latest` দিয়ে প্রতিস্থাপন করুন।

## REA কীভাবে কাজ করে

এজেন্ট MCP-এর মাধ্যমে REA-কে কল করে টার্গেট পরীক্ষা ও প্রাসঙ্গিক কোড অনুসন্ধান করে। REA অনুসন্ধানের ফলাফল ও প্রমাণ ফেরত দেয়। এজেন্ট এগুলো ব্যবহার করে অতিরিক্ত প্রশ্ন করে, আচরণ ব্যাখ্যা করে, অথবা বাস্তবায়ন লেখে ও পরীক্ষা করে। CLI কমান্ডও একই ওয়ার্কফ্লো অনুসরণ করে।

![REA তদন্ত প্রবাহ: এজেন্ট একটি স্থানীয় টার্গেট সম্পর্কে প্রশ্ন করে, REA বিশ্লেষণ সরঞ্জাম দিয়ে টার্গেট পরীক্ষা ও অনুসন্ধান করে। এজেন্ট প্রাপ্ত কোড, রেফারেন্স ও অনিশ্চিত বিষয়গুলো ব্যবহার করে ব্যাখ্যা, বাস্তবায়ন ও পরীক্ষা করে।](../../website/public/assets/figures/rea-investigation-flow.svg)

[পূর্ণ আকারের চিত্র দেখুন](../../website/public/assets/figures/rea-investigation-flow.svg)।

<a id="current-status"></a>

## কী কী বিশ্লেষণ করা যায়

REA-তে Node.js 22.x(>=22.19), 24.x(>=24.11) বা 26+ এবং npm প্রয়োজন। অতিরিক্ত টুল ও হোস্ট সমর্থন টার্গেট অনুযায়ী ভিন্ন।

| টার্গেট                | REA যা ফেরত দেয়                                                                | প্রয়োজনীয়তা ও গাইড                                                                                                              |
| ----------------------- | -------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| নেটিভ বাইনারি          | সিউডোকোড, অ্যাসেম্বলি, স্ট্রিং, সিম্বল, কল, রেফারেন্স                         | Hopper, Ghidra বা IDA; [নেটিভ বিশ্লেষণ](../native-investigation.md)                                                               |
| অফলাইন ELF লেআউট      | সেকশন, সেগমেন্ট, মূল সিম্বল/রিলোকেশন তথ্য, স্ট্যাটিক বিশ্লেষণ থেকে নিরাপত্তা প্রশমন প্রার্থী | Linux x64-এ কলকারী প্রদত্ত pwntools; [বাইনারি ডায়াগনস্টিক্স](../binary-diagnostics.md)                                           |
| Go বাইনারি             | এমবেডেড কম্পাইলার সংস্করণ, মডিউল, `replace` নির্দেশ, বিল্ড সেটিংস              | REA বিল্ট-ইন ELF/PE/thin Mach-O স্ট্যাটিক পরিদর্শন; Go ইনস্টলেশন অপ্রয়োজনীয়                                                    |
| Rust বাইনারি           | cargo-auditable এমবেডেড ক্রেট নাম, সংস্করণ, উৎস, নির্ভরতা সম্পর্ক              | REA বিল্ট-ইন ELF/PE/thin Mach-O স্ট্যাটিক পরিদর্শন; [Rust বাইনারি](../rust-binaries.md)                                          |
| WASM আর্টিফ্যাক্ট     | ভ্যালিডেশন, সেকশন, import/export-এর সুনির্দিষ্ট WAT ফর্ম্যাট, ডিকোডকৃত WAT    | কলকারী প্রদত্ত WABT 1.0.42; `inspect_wasm_artifact`                                                                               |
| EVM বাইটকোড            | ডিসপ্যাচ সিলেক্টর, বাইট অফসেট, অনুমিত আর্গুমেন্ট ও স্টেট পরিবর্তনযোগ্যতা     | Linux x64-এ স্থানীয় কাঁচা বাইট/হেক্স ইনপুট ফাইল; [অফলাইন EVM গাইড](../evm-bytecode.md)                                          |
| SQLite ডাটাবেস         | টেবিল, কলাম, ইনডেক্স, ভিউ, ট্রিগার, নির্বাচিত সাধারণ টেবিলের সারি              | স্থানীয় ডাটাবেস/WAL স্ন্যাপশট; Node.js 24.15+ বা 26+ (নেটিভ SQLite সীমা প্রযোজ্য)                                               |
| রেকর্ডকৃত Linux ক্র্যাশ | কাঁচা note রেকর্ড, রেকর্ডকৃত সব থ্রেডের রেজিস্টার/সিগন্যাল, ঐচ্ছিক ম্যাপিং প্রার্থী | Linux x64-এ কলকারী প্রদত্ত pwntools; GDB/pwndbg ঐচ্ছিক; [রেকর্ডকৃত ক্র্যাশ](../recorded-crashes.md)                              |
| JavaScript / Electron  | মডিউল, ইম্পোর্ট, সোর্স ম্যাপ, রাউট, IPC, নেটিভ অ্যাডঅন সম্পর্ক               | Node.js ও npm; Linux: procps-সামঞ্জস্যপূর্ণ `ps`; [অ্যাপ্লিকেশন বিশ্লেষণ](../javascript-application-workflows.md)                |
| ওয়েবসাইট              | পৃষ্ঠার গঠন, স্ক্রিপ্ট, নেটওয়ার্ক পর্যবেক্ষণ ফলাফল, অনুরোধকৃত স্ক্রিনশট      | Chrome-ভিত্তিক ব্রাউজার; [ব্রাউজার বিশ্লেষণ](../browser-observation.md)                                                           |
| সংরক্ষিত নেটওয়ার্ক ক্যাপচার | অনুরোধ, প্রতিক্রিয়া, অ্যাক্সেসযোগ্য পেলোড, উৎস অবস্থান                  | HAR বা Fiddler Everywhere SAZ; mitmproxy নেটিভ ক্যাপচারে Linux-এ mitmdump; [ক্যাপচার গাইড](../web-network-captures.md)             |
| .NET অ্যাসেম্বলি       | মেটাডেটা, CIL নির্দেশ, ঘোষিত নেটিভ নির্ভরতা, বিল্ড তুলনা                      | আলাদা টুল অপ্রয়োজনীয় (শুধু স্ট্যাটিক পরিদর্শন); [ম্যানেজড কোড গাইড](../managed-code-analysis.md)                               |
| Android APK            | ম্যানিফেস্ট ঘোষণা, ক্লাস, ডিকম্পাইলকৃত মেথড, রেফারেন্স                        | Linux/macOS/Windows x64-এ হেডলেস JADX ও সম্পূর্ণ JDK; [Android গাইড](../android-analysis.md)                                      |
| Android ডিভাইস        | ডিভাইস, প্যাকেজ, প্রসেস, লগ, ডাম্প, স্ক্রিন ক্যাপচার, APK/ফাইল স্থানান্তর    | কলকারী প্রদত্ত adb (এমুলেটর বা বাস্তব ডিভাইস); [ADB গাইড](../adb-device-analysis.md)                                             |
| JEB প্রজেক্ট          | ইঞ্জিন-ভিত্তিক প্রজেক্ট ইউনিট, আর্টিফ্যাক্ট হ্যাশ, টাইপ/মেথড সিউডোকোড       | কলকারী দ্বারা চালু ও MCP প্রদানকারী JEB ক্লায়েন্ট (REA_JEB_MCP_URL দ্বারা নির্বাচন); [JEB গাইড](../jeb-analysis.md)              |
| Android রিসোর্স       | ডিকোডকৃত ম্যানিফেস্ট, স্ট্রিং টেবিল, লোকেল, সংস্করণ তথ্য                      | কলকারী প্রদত্ত Apktool লঞ্চার; [রিসোর্স গাইড](../apktool-resource-analysis.md)                                                   |
| Flutter অ্যাপ          | Dart স্ন্যাপশট হ্যাশ, ABI-নির্দিষ্ট লাইব্রেরি হ্যাশ, ইঞ্জিন বিল্ড উৎস        | নেই (স্ট্যাটিক APK পার্সিং); [Flutter গাইড](../flutter-analysis.md)                                                               |
| ফার্মওয়্যার           | অঞ্চল, নিষ্কাশন ফলাফল, নেটিভ বিশ্লেষণে প্রেরণের তথ্য                           | Linux-এ Binwalk / Unblob; [ফার্মওয়্যার গাইড](../firmware-analysis.md)                                                             |
| রেকর্ডকৃত প্যাকেট     | নির্বাচিত ফিল্ড, পুনরাবৃত্ত মান, ফিল্টার ও ডিকোডিং নিয়ম                       | Linux: TShark 4.x + prlimit; [ক্যাপচার গাইড](../packet-captures.md)                                                               |
| প্যাকেট সারাংশ        | এন্ডপয়েন্ট, DNS, TLS SNI, প্রোটোকল বিতরণ, HTTP অনুরোধ                          | কলকারী প্রদত্ত tshark ও capinfos (Linux-এ যাচাইকৃত); [pcap গাইড](../pcap-analysis.md)                                             |
| রেকর্ডকৃত লজিক সিগন্যাল | ডিকোডার টীকা, স্যাম্পল পরিসর, ডায়াগনস্টিক তথ্য                              | Linux: sigrok-cli 0.7.2 + prlimit; [সিগন্যাল রেকর্ডিং গাইড](../signal-recordings.md)                                              |
| প্যাকেজ ও রিসোর্স     | ফাইল তালিকা, ডাইজেস্ট, plist, Apple বান্ডেল গঠন, নিষ্কাশিত রিসোর্স             | [আর্টিফ্যাক্ট ও JavaScript গাইড](../javascript-artifact-reconstruction.md), [Apple অ্যাপ্লিকেশন](../apple-application-analysis.md) |
| প্রসেস আচরণ           | টার্মিনাল আউটপুট, ইন্টারঅ্যাকশন, প্রস্থান ও ফাইল সিস্টেম পর্যবেক্ষণ, এক্সিকিউশন তুলনা | নেটিভ PTY সমর্থনকারী Linux/macOS; [প্রসেস ক্যাপচার](../process-capture.md)                                                        |

স্ট্যাটিক JavaScript ও .NET পরিদর্শন প্রদত্ত ফাইল পড়ে এবং অ্যাপ্লিকেশন চালায় না। রানটাইম ক্যাপচার ব্যবহারকারীর অনুমতিতে নির্বাচিত টার্গেট চালায় বা তার সাথে ইন্টারঅ্যাক্ট করে। প্রতিটি রানটাইম গাইডে এর প্রভাব ব্যাখ্যা করা আছে।

অফলাইন নেটিভ বাইনারি পরিদর্শনে কলকারী প্রদত্ত GNU objdump ও Rizin-ও ব্যবহার করা যায়। প্রোভাইডার সেটআপ, CLI কমান্ড, Evidence-এর সীমাবদ্ধতার জন্য [রিভার্স ইঞ্জিনিয়ারিং টুল গাইড](../reverse-engineering-tools.md) দেখুন। REA objdump বা Rizin ইনস্টল বা আপডেট করে না।

<a id="choosing-a-deep-analysis-provider"></a>

সমর্থিত নেটিভ ফর্ম্যাট ও হোস্ট প্রোভাইডার অনুযায়ী ভিন্ন। [Hopper ও Ghidra সেটআপ](../installation.md#hopper), [IDA গাইড](../ida-provider.md) (ঐচ্ছিক নেটিভ MCP ব্রিজসহ), [পরীক্ষামূলক Windows Ghidra সমর্থন](../windows-ghidra-p0.md) দেখুন। Ghidra [16-বিট DOS বিশ্লেষণ](../ghidra-dos.md)-ও সমর্থন করে। বড় বাইনারি বিশ্লেষণে `REA_GHIDRA_STARTUP_TIMEOUT_MS` বা `REA_HOPPER_STARTUP_TIMEOUT_MS` দিয়ে প্রোভাইডারের স্টার্টআপ টাইমআউট বাড়ান। প্রোভাইডার নির্বাচনের জন্য [CLI গাইড](../cli.md#choose-a-provider) দেখুন। সর্বশেষ npm রিলিজের পরে যোগ হওয়া ফিচারের জন্য [রিলিজে প্রাপ্যতা](../installation.md#released-package-and-main) দেখুন।

## শোকেস

[![DX-Ball সাউন্ড প্যানিং, Notion ক্লিপবোর্ড ব্রিজ, TH04 বুলেট রিং শোকেস দেখানো চিত্র](../assets/rea-showcases.png)](https://rea.tools/showcase/)

### DX-Ball: সাউন্ড প্যানিং ক্যালকুলেশন পুনর্বাস্তবায়ন

সাউন্ড কল থেকে পজিশনকে প্যানিং মানে রূপান্তরকারী হেল্পার ফাংশন পর্যন্ত ট্রেস করা হয়, নির্দেশনা পরীক্ষা করে অসম্পূর্ণ সিউডোকোড C-তে রূপান্তর করা হয়। পুনর্বাস্তবায়িত কোড মূল x86-এর বিপরীতে ৩,২০৫টি টেস্ট কেস পাস করে এবং কম্পাইলকৃত ফাংশনের সম্পূর্ণ ৬৩ বাইট পুনরুৎপাদন করে।

[শোকেস পড়ুন](https://rea.tools/showcase/dx-ball/) ·
[পুনর্বাস্তবায়ন রিপোজিটরি](https://github.com/N0zoM1z0/dx-ball)

### Notion: Electron ক্লিপবোর্ড ব্রিজ ট্রেসিং

রেন্ডারারের ক্লিপবোর্ড API খুঁজে বের করা, preload ও IPC হয়ে মেইন প্রসেস পর্যন্ত ট্রেস করা, তারপর রিচ ক্লিপবোর্ড ফর্ম্যাট পরীক্ষা করা।

[শোকেস পড়ুন](https://rea.tools/showcase/notion/)

### TH04: DOS সার্কুলার বুলেট প্যাটার্ন ক্যালকুলেশন পুনরুদ্ধার

মূল PC-98 গেমের ১৬-বিট নির্দেশনা পরীক্ষা করা এবং ফিক্সড ও এইমড অ্যাঙ্গেল ক্যালকুলেশন পুনরুদ্ধার করা। পুনর্বাস্তবায়িত C++ তৎকালীন কম্পাইলারের আউটপুটের সাথে তুলনা করা।

[শোকেস পড়ুন](https://rea.tools/showcase/th04/) ·
[পুনর্বাস্তবায়ন রিপোজিটরি](https://github.com/N0zoM1z0/th04)

REA দিয়ে আকর্ষণীয় কিছু বিশ্লেষণ করে থাকলে আমাদের জানান। [issue](https://github.com/morluto/rea/issues) বা [pull request](https://github.com/morluto/rea/pulls)-এ টার্গেট, তদন্তের প্রশ্ন, REA কীভাবে সাহায্য করেছে এবং কী আবিষ্কার করেছেন তা শেয়ার করুন।

## প্রায়শই জিজ্ঞাসিত প্রশ্ন

<details>
<summary><strong>কোন কোন এজেন্টে REA ব্যবহার করা যায়?</strong></summary>

লোকাল MCP সার্ভার সমর্থনকারী যেকোনো এজেন্টে ব্যবহার করা যায়। সেটআপ প্রক্রিয়া [সমর্থিত এজেন্ট](../installation.md#supported-agents) কনফিগার করে। অন্যান্য ক্লায়েন্ট [ম্যানুয়াল MCP নিবন্ধন](../installation.md#mcp-registry) ব্যবহার করতে পারে।

</details>

<details>
<summary><strong>Hopper, Ghidra বা IDA কি দরকার?</strong></summary>

গভীর নেটিভ বিশ্লেষণে এদের যেকোনো একটি ব্যবহৃত হয়। স্ট্যাটিক JavaScript ও .NET পরিদর্শনে নেটিভ অ্যানালাইসিস ইঞ্জিন লাগে না। সেটআপের সময় অনুমোদন দিলে Hopper ইনস্টল করা যায়; Ghidra ও IDA বিদ্যমান ইনস্টলেশন ব্যবহার করে। [প্রোভাইডার সেটআপ](../installation.md#hopper) দেখুন।

</details>

<details>
<summary><strong>Hopper কি আগে চালু করতে হবে?</strong></summary>

REA প্রয়োজনে Hopper চালু করে। macOS-এ প্রথমবার চালানোর সময় ডেমো মোড নির্বাচন বা লাইসেন্স সক্রিয় করার ডায়ালগ আসতে পারে। প্রথম CLI/MCP কাজ বা অনুপস্থিত কাজ চালানোর আগে একই ব্যবহারকারী সেশনে এই ডায়ালগ সম্পন্ন করুন। প্রয়োজনে Hopper নিজে খুলুন। [Hopper চালু করা ও সমস্যা সমাধান](../installation.md#launcher-paths-and-troubleshooting) দেখুন।

</details>

<details>
<summary><strong>skills.sh থেকে ইনস্টল করা স্কিল কী করে?</strong></summary>

স্কিল এজেন্টকে তদন্তের নির্দেশনা প্রদান করে। `npx rea-agents setup` দিয়ে REA-এর MCP সার্ভার নিবন্ধন করুন, সংস্করণ-নির্দিষ্ট নির্দেশনা ইনস্টল করুন ও এজেন্ট পুনরায় চালু করুন। [শুধু স্কিল ইনস্টলেশন](../installation.md#skill-only-installation) দেখুন।

</details>

<details>
<summary><strong>REA কী ধরনের কোড ফেরত দেয়?</strong></summary>

নেটিভ বিশ্লেষণ সিউডোকোড ও অ্যাসেম্বলি ফেরত দেয়। JavaScript/Electron বিশ্লেষণ মডিউল ও তাদের সম্পর্ক পুনরুদ্ধার করে। এজেন্ট এই ফলাফল ব্যবহার করে বাস্তবায়ন লেখে ও পরীক্ষা করে। [শোকেস](#শোকেস)-এ নির্দিষ্ট উদাহরণ দেখুন।

</details>

<details>
<summary><strong>REA কি আমার অ্যাপ আপলোড করে?</strong></summary>

REA টার্গেট স্থানীয়ভাবে বিশ্লেষণ করে। এজেন্ট টুলের ফলাফল গ্রহণ করে এবং এজেন্টের মডেল প্রোভাইডারের নিজস্ব ডেটা পলিসি আছে।

</details>

<details>
<summary><strong>বাগ পেলে কী করব?</strong></summary>

প্রথমে আপডেট করুন। সাম্প্রতিক রিলিজে ইতিমধ্যে ঠিক হয়ে থাকতে পারে।

`npm install --global` বা `bun add --global` দিয়ে ইনস্টল করা CLI-তে:

```bash
rea update
```

`npx` দিয়ে এজেন্ট সেটআপ করে থাকলে:

```bash
npx rea-agents@latest setup
```

এজেন্ট ব্যবহার করলে [সেটআপ আপডেট](#rea-আপডেট) সম্পন্ন করুন ও পুনরায় চালু করুন। একই কাজ আবার চেষ্টা করুন। সমস্যা থাকলে REA সংস্করণ, টার্গেট ধরন, পুনরুৎপাদন ধাপ ও ত্রুটি আউটপুটসহ [issue দাখিল করুন](https://github.com/morluto/rea/issues)।

</details>

## ডকুমেন্টেশন

ওয়েবসাইটের [হ্যান্ডস-অন গাইড](https://rea.tools/guides/) দিয়ে শুরু করুন। সঠিক অপশন, পূর্বশর্ত ও ফলাফল চুক্তির জন্য নিচের ডকুমেন্টেশন দেখুন।

- [ইনস্টলেশন ও সেটআপ](../installation.md): এজেন্ট নিবন্ধন, প্রোভাইডার কনফিগারেশন, আপডেট, আনইনস্টল।
- [প্রস্তুতি যাচাই ও সমস্যা সমাধান](../installation.md#check-readiness-for-your-task): নির্দিষ্ট এজেন্ট বা অ্যানালাইসিস ইঞ্জিন ডায়াগনস্টিক্স।
- [CLI ও Evidence](../cli.md): কমান্ড, প্রোভাইডার নির্বাচন, স্ন্যাপশট, ইম্পোর্ট/এক্সপোর্ট, এক্সিট কোড।
- [MCP চুক্তি](../mcp-contracts.md) ও [এজেন্ট প্রম্পট](../mcp-prompts.md): টুল ফলাফল, সেশন, নির্দেশিত তদন্ত।
- [টুল ক্যাটালগ](../mcp-contracts.md#generated-catalog): বিল্ড-সময়ে তৈরি টুল, প্রোভাইডার, CLI কমান্ড তালিকা।
- [রোডম্যাপ](../roadmap.md): পরিকল্পিত কাজ ও ফিচার অগ্রগতি।

দুর্বলতা [SECURITY.md](../../SECURITY.md) অনুযায়ী রিপোর্ট করুন।

## স্টার ইতিহাস

🎉 **GitHub স্টার ২,০০,০০০ — ধন্যবাদ!**

REA ব্যবহার, বাগ রিপোর্ট, ফিচার অনুরোধ, বিল্ড পরীক্ষা ও ফিক্সে অবদান রাখা সকলকে ধন্যবাদ।

<a href="https://www.star-history.com/?repos=morluto%2Frea&amp;type=date">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/chart?repos=morluto/rea&amp;type=date&amp;theme=dark&amp;legend=top-left" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/chart?repos=morluto/rea&amp;type=date" />
    <img alt="REA GitHub স্টার ইতিহাস" src="https://api.star-history.com/chart?repos=morluto/rea&amp;type=date" />
  </picture>
</a>

## দাবিত্যাগ

দায়িত্বশীল ব্যবহার সম্পর্কে নির্দেশনার জন্য [DISCLAIMER.md](../../DISCLAIMER.md) দেখুন।

অবৈধ বা অননুমোদিত ব্যবহার সম্পর্কে প্রজেক্টের অবস্থান সকল REA সংস্করণ, বিতরণ চ্যানেল ও প্ল্যাটফর্মে প্রযোজ্য এবং প্রতিটি কপিতে সংশ্লিষ্ট লাইসেন্স অক্ষত থাকে।

REA আইন-মান্যকারী গবেষণা, শিক্ষা, আন্তঃক্রিয়াশীলতা, সফটওয়্যার সংরক্ষণ এবং আপনার মালিকানাধীন বা তদন্তের অনুমতিপ্রাপ্ত সফটওয়্যার বিশ্লেষণের জন্য একটি টুল।

## অবদান

REA-তে সাহায্য করুন! [issue দাখিল করুন](https://github.com/morluto/rea/issues) বাগ বা ফিচার প্রস্তাব করতে, অথবা [pull request পাঠান](https://github.com/morluto/rea/pulls) কোড ও ডকুমেন্টেশন উন্নত করতে।

ডেভেলপমেন্ট পরিবেশ ও চেকলিস্টের জন্য [CONTRIBUTING.md](../../CONTRIBUTING.md), যাচাই পদ্ধতির জন্য [টেস্টিং গাইড](../testing.md), প্রজেক্ট কাঠামোর জন্য [আর্কিটেকচার ম্যাপ](../architecture.mermaid) দেখুন।

## লাইসেন্স

[MIT](../../LICENSE)

REA-র লেখা কোড MIT লাইসেন্সের অধীনে। তৃতীয় পক্ষের উপকরণে তাদের নিজস্ব লাইসেন্স ও কপিরাইট নোটিশ অক্ষত থাকে। নির্ভরতা তালিকা, সংরক্ষিত লাইসেন্স মূলপাঠ ও বাহ্যিক টুলের শর্তাবলীর জন্য [তৃতীয় পক্ষের নোটিশ](../../THIRD_PARTY_NOTICES.md) দেখুন।

IDA Pro / Hex-Rays ডিকম্পাইলার, Hopper, JEB ইত্যাদি বাণিজ্যিক সরঞ্জাম তাদের নিজস্ব লাইসেন্স অনুযায়ী **বৈধভাবে অর্জিত ও ব্যবহারের অনুমতিপ্রাপ্ত হতে হবে।** REA কোনো টুলের লাইসেন্স, কী বা সক্রিয়করণ অধিকার প্রদান করে না। ট্রায়াল ও ডেমো ব্যবহারকারী, ফিচার, অটোমেশন ও আউটপুট শেয়ারিং সীমাবদ্ধতাসহ সরবরাহকারীর শর্তাবলী মেনে চলে। ক্র্যাকড সংস্করণ, চুরি করা কী, অননুমোদিত কী শেয়ারিং বা লাইসেন্স সীমাবদ্ধতা বাইপাস অনুমোদিত নয়। এই নির্দেশনা MIT লাইসেন্স বা তৃতীয় পক্ষের লাইসেন্স পরিবর্তন করে না।
