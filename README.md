# Fulcrum Marketing Module

Marketing skills for AI agents, built by **Fulcrum Labs** and wired into FulcrumOS. Outbound, copywriting, offers, pricing, sales enablement, SEO, content, analytics and growth, as Agent Skills for Claude Code, Codex, Cursor and any agent that supports the [Agent Skills spec](https://agentskills.io).

- **Skills** live in `skills/`; tool integration guides and CLIs live in `tools/`.
- **Fulcrum layer** lives in `fulcrum/`:
  - `fulcrum/scripts/install.sh <workspace>` copies the skills into `<workspace>/.claude/skills` and the tool guides into `.claude/marketing-tools`. It skips any same-named skill it didn't install (`--force` to replace) and is safe to re-run for updates.
  - `fulcrum/product-marketing.md` is Fulcrum Labs' own context bridge. It's installed only with `--with-fulcrum-bridge`, in Fulcrum's internal workspace.

## Install into your OS

Open Claude Code in your OS folder and send:

> Install the Fulcrum Marketing Module into my OS. Follow the instructions at https://raw.githubusercontent.com/aaryapranshu/fulcrum-marketing-module/main/INSTALL.md step by step, then tell me what you installed.

The full agent instructions (macOS, Linux and Windows) are in [INSTALL.md](INSTALL.md).

---

## What are Skills?

Skills are markdown files that give AI agents specialized knowledge and workflows for specific tasks. When you add these to your project, your agent can recognize when you're working on a marketing task and apply the right frameworks and best practices.

## How Skills Work Together

Skills reference each other and build on shared context. The `product-marketing` skill is the foundation — every other skill checks it first to understand your product, audience, and positioning before doing anything.

```
                            ┌──────────────────────────────────────┐
                            │          product-marketing           │
                            │    (read by all other skills first)  │
                            └──────────────────┬───────────────────┘
                                               │
    ┌──────────────┬─────────────┬─────────────┼─────────────┬──────────────┬──────────────┐
    ▼              ▼             ▼             ▼             ▼              ▼              ▼
┌──────────┐ ┌──────────┐ ┌──────────┐ ┌────────────┐ ┌──────────┐ ┌─────────────┐ ┌───────────┐
│  SEO &   │ │   CRO    │ │Content & │ │  Paid &    │ │ Growth & │ │  Sales &    │ │ Strategy  │
│ Content  │ │          │ │   Copy   │ │Measurement │ │Retention │ │    GTM      │ │           │
├──────────┤ ├──────────┤ ├──────────┤ ├────────────┤ ├──────────┤ ├─────────────┤ ├───────────┤
│seo-audit │ │cro       │ │copywritin│ │ads         │ │referrals │ │revops       │ │mktg-ideas │
│ai-seo    │ │signup    │ │copy-edit │ │ad-creative │ │free-tools│ │sales-enable │ │mktg-psych │
│site-arch │ │onboarding│ │cold-email│ │ab-testing  │ │churn-    │ │launch       │ │customer-  │
│programm  │ │popups    │ │emails    │ │analytics   │ │ prevent  │ │pricing      │ │ research  │
│schema    │ │paywalls  │ │social    │ │            │ │community │ │competitors  │ │           │
│content   │ │          │ │video     │ │            │ │lead-magnt│ │comp-profile │ │           │
│aso       │ │          │ │image     │ │            │ │co-mktg   │ │directory    │ │           │
│          │ │          │ │sms       │ │            │ │          │ │prospecting  │ │           │
└────┬─────┘ └────┬─────┘ └────┬─────┘ └─────┬──────┘ └────┬─────┘ └──────┬──────┘ └─────┬─────┘
     │            │            │              │             │              │              │
     └────────────┴─────┬──────┴──────────────┴─────────────┴──────────────┴──────────────┘
                        │
         Skills cross-reference each other:
           copywriting ↔ cro ↔ ab-testing
           revops ↔ sales-enablement ↔ cold-email
           seo-audit ↔ schema ↔ ai-seo
           customer-research → copywriting, cro, competitors
```

See each skill's **Related Skills** section for the full dependency map.

## Available Skills

<!-- SKILLS:START -->
| Skill | Description |
|-------|-------------|
| [ab-testing](skills/ab-testing/) | Plan, design, size and read A/B tests and growth experiments. Use for split tests, experiment design, sample size,... |
| [ad-creative](skills/ad-creative/) | Write and iterate ad creative at scale: headlines, primary text, hooks, angles and full variations for Google, Meta,... |
| [ads](skills/ads/) | Plan, run and fix paid ad campaigns on Google, Meta, LinkedIn, X or TikTok. Use for PPC, targeting, budgets, bidding,... |
| [ai-seo](skills/ai-seo/) | Get cited in AI answers (ChatGPT, Perplexity, Google AI Overviews). Use for AI SEO, AEO, GEO, LLM visibility, or... |
| [analytics](skills/analytics/) | Set up, audit and fix marketing analytics: GA4, GTM, event and conversion tracking, UTMs, tracking plans, or 'how do I... |
| [aso](skills/aso/) | Audit and optimize App Store / Google Play listings: ASO, keywords, screenshots, ratings and conversion of app store... |
| [attribution](skills/attribution/) | Work out which marketing drives revenue: attribution models, multi-touch, MMM, incrementality, self-reported... |
| [churn-prevention](skills/churn-prevention/) | Reduce churn: cancellation flows, save offers, failed-payment recovery (dunning), win-back and retention strategy. |
| [co-marketing](skills/co-marketing/) | Find co-marketing partners and plan joint campaigns: partner marketing, co-webinars, co-branded content, integration... |
| [cold-email](skills/cold-email/) | Write and run B2B cold outbound: cold emails, follow-ups, LinkedIn outreach and connection messages, multichannel... |
| [community-marketing](skills/community-marketing/) | Build and grow a community for brand and product growth: Slack/Discord/forums, community strategy, engagement,... |
| [competitor-profiling](skills/competitor-profiling/) | Research and profile competitors from their URLs: positioning, pricing, messaging, strengths and gaps, competitive... |
| [competitors](skills/competitors/) | Create competitor comparison and alternative pages ('X vs Y', 'X alternatives') for SEO and buyers, plus battle-card... |
| [content-strategy](skills/content-strategy/) | Plan a content strategy: what to write, topic clusters, editorial calendar, content pillars, distribution, 'what should... |
| [copy-editing](skills/copy-editing/) | Edit, tighten and de-slop existing copy: proofread, polish, remove AI tells, 'make this sound human', refresh outdated... |
| [copywriting](skills/copywriting/) | Write or rewrite marketing copy: homepage, landing, pricing, about and product pages, headlines, CTAs, value... |
| [cro](skills/cro/) | Increase conversions on a page or form: landing page and homepage CRO, pricing page, lead capture forms, 'why isn't... |
| [customer-research](skills/customer-research/) | Run and synthesize customer research: interviews, call transcripts, reviews, surveys, ICP research, jobs-to-be-done,... |
| [directory-submissions](skills/directory-submissions/) | Submit a product to startup, SaaS, AI, MCP and review directories for backlinks, domain rating and discovery. |
| [emails](skills/emails/) | Write and optimize email sequences: drip, nurture, welcome, onboarding, lifecycle, newsletters and automated flows (not... |
| [events](skills/events/) | Plan and get pipeline from events: webinars, conferences, trade shows, meetups, dinners, workshops, sponsorship and... |
| [free-tools](skills/free-tools/) | Plan or build a free tool for marketing (engineering as marketing): calculators, graders, generators for leads, SEO or... |
| [image](skills/image/) | Create or edit marketing images: social graphics, blog heroes, banners, mockups, ad images and brand visuals, with AI... |
| [influencer-marketing](skills/influencer-marketing/) | Run influencer, creator, ambassador, newsletter and podcast sponsorships: finding and vetting partners, deals, briefs,... |
| [launch](skills/launch/) | Plan a product or feature launch: launch strategy, Product Hunt, announcements, go-to-market timeline, release comms. |
| [lead-magnets](skills/lead-magnets/) | Create and optimize lead magnets: gated content, checklists, templates, guides, content upgrades and opt-in offers for... |
| [marketing-council](skills/marketing-council/) | Pressure-test a marketing decision with a simulated board of expert advisors giving multiple perspectives and a... |
| [marketing-ideas](skills/marketing-ideas/) | Generate marketing and growth ideas: 'how should I market this', tactics, channels to try, guerrilla and unconventional... |
| [marketing-loops](skills/marketing-loops/) | Set up recurring, self-running marketing workflows an AI agent runs on a schedule or trigger: weekly content, outbound... |
| [marketing-plan](skills/marketing-plan/) | Write a full marketing or GTM plan for a business: channels, budget, quarterly milestones, team and tactics in one plan... |
| [marketing-psychology](skills/marketing-psychology/) | Apply psychology and behavioral science to marketing: persuasion, cognitive biases, mental models, pricing psychology. |
| [offers](skills/offers/) | Design or improve an offer: value stack, bonuses, guarantees, urgency, naming, packaging and 'make this offer... |
| [onboarding](skills/onboarding/) | Improve post-signup onboarding and activation: first-run experience, time-to-value, activation rate, onboarding emails... |
| [paywalls](skills/paywalls/) | Create or optimize in-app paywalls, upgrade screens, upsell modals and feature gates. |
| [popups](skills/popups/) | Create or optimize popups, modals, exit-intent, slide-ins and banners for conversion. |
| [pricing](skills/pricing/) | Make pricing and packaging decisions: price points, tiers, freemium vs trial, value metrics, raising prices, pricing... |
| [product-marketing](skills/product-marketing/) | Create or update the business's product marketing context (positioning, ICP, voice, proof) that every other marketing... |
| [programmatic-seo](skills/programmatic-seo/) | Build SEO pages at scale from templates and data: programmatic SEO, location/integration/comparison pages, directory... |
| [prospecting](skills/prospecting/) | Find, qualify and build lists of prospects: ICP definition, lead lists, buying signals, enrichment and account research... |
| [public-relations](skills/public-relations/) | Earn press coverage: PR strategy, journalist pitching, press releases, media lists, newsjacking, podcast guesting. |
| [referrals](skills/referrals/) | Create or improve referral, affiliate and word-of-mouth programs: incentives, tracking, review programs, partner... |
| [revops](skills/revops/) | Revenue operations: lead lifecycle, lead scoring and routing, marketing-to-sales handoff, pipeline stages, CRM process. |
| [sales-enablement](skills/sales-enablement/) | Create sales collateral: pitch decks, one-pagers, objection handling, demo scripts, case studies, battle cards, call... |
| [schema](skills/schema/) | Add or fix schema markup and structured data (JSON-LD) for rich results. |
| [seo-audit](skills/seo-audit/) | Audit and diagnose SEO: technical SEO, on-page issues, 'why am I not ranking', traffic drops, indexing problems. |
| [signup](skills/signup/) | Optimize signup, registration and trial-start flows to reduce friction and increase signups. |
| [site-architecture](skills/site-architecture/) | Plan website structure: page hierarchy, navigation, URL structure, sitemaps, internal linking, site migrations. |
| [sms](skills/sms/) | Plan and optimize SMS, MMS and WhatsApp marketing: welcome flows, abandoned cart, promos, compliance. |
| [social](skills/social/) | Create and optimize social content for LinkedIn, X, Instagram, TikTok or Facebook: posts, hooks, calendars,... |
| [video](skills/video/) | Create marketing video with AI or code: product demos, explainers, short-form clips, avatars, programmatic video. |
<!-- SKILLS:END -->

## Installation

### Option 1: CLI Install (Recommended)

Use [npx skills](https://github.com/vercel-labs/skills) to install skills directly:

```bash
# Install all skills
npx skills add aaryapranshu/fulcrum-marketing-module

# Install specific skills
npx skills add aaryapranshu/fulcrum-marketing-module --skill cro copywriting

# List available skills
npx skills add aaryapranshu/fulcrum-marketing-module --list
```

The CLI detects which agents you have installed and asks where to install. For Claude Code it installs into `.claude/skills/`; universal agents share `.agents/skills/`.

> [!TIP]
> If you run the command from **inside** an agent session (e.g., asking Claude Code to install the skills for you), the CLI runs non-interactively and may only install to the universal `.agents/skills/` directory, which Claude Code does not read. Pass the agent explicitly:
>
> ```bash
> npx skills add aaryapranshu/fulcrum-marketing-module -a claude-code
> ```

### Option 2: Claude Code Plugin

Install via Claude Code's built-in plugin system:

```bash
# Add the marketplace
/plugin marketplace add aaryapranshu/fulcrum-marketing-module

# Install all marketing skills
/plugin install marketing-skills
```

> **Note:** `/plugin` is only available in an interactive Claude Code CLI session. It is **not** available in Claude Code on the web, GitHub Actions, or other non-interactive/remote environments — in those cases you'll see `/plugin isn't available in this environment`. Use **Option 1 (`npx skills`)** instead, or the equivalent CLI commands:
>
> ```bash
> claude plugin marketplace add aaryapranshu/fulcrum-marketing-module
> claude plugin install marketing-skills@fulcrum-marketing-module
> ```

### Option 3: OpenAI Codex Plugin

Install via Codex's plugin system:

```bash
# Add the marketplace
codex plugin marketplace add aaryapranshu/fulcrum-marketing-module

# Then browse and install from inside a Codex session
/plugins
```

Select **marketing-skills** to install all skills. To pick up new releases later, run `codex plugin marketplace upgrade`.

### Option 4: Clone and Copy

Clone the entire repo and copy the skills folder:

```bash
git clone https://github.com/aaryapranshu/fulcrum-marketing-module.git
cp -r fulcrum-marketing-module/skills/* .agents/skills/
```

### Option 5: Git Submodule

Add as a submodule for easy updates:

```bash
git submodule add https://github.com/aaryapranshu/fulcrum-marketing-module.git .agents/fulcrum-marketing-module
```

Then reference skills from `.agents/fulcrum-marketing-module/skills/`.

### Option 6: Fork and Customize

1. Fork this repository
2. Customize skills for your specific needs
3. Clone your fork into your projects

### Option 7: SkillKit (Multi-Agent)

Use [SkillKit](https://github.com/rohitg00/skillkit) to install skills across multiple AI agents (Claude Code, Cursor, Copilot, etc.):

```bash
# Install all skills
npx skillkit install aaryapranshu/fulcrum-marketing-module

# Install specific skills
npx skillkit install aaryapranshu/fulcrum-marketing-module --skill cro copywriting

# List available skills
npx skillkit install aaryapranshu/fulcrum-marketing-module --list
```

### Option 8: Claude Web Skill ZIPs

Download the desired `<name>-claude-web.zip` from [Releases](https://github.com/aaryapranshu/fulcrum-marketing-module/releases/latest), then use **Customize → Skills → + Create skill → Upload a skill** in Claude. Each archive contains one skill. Account permissions and code execution must allow skills.

The web-target archive uses an explicitly reviewed shorter description; its instructions and resources are preserved. The attached web manifest lists any skills whose description still needs review; newly created release notes also summarize omissions. Installing a ZIP does not configure local CLIs, MCP servers, credentials, or related skills. See [release packaging and verification](docs/skill-release-packaging.md) for archive contents, source variants, and unverified client limitations.

## Upgrading from v1.x to v2.0

v2.0 renames 17 skills and consolidates `page-cro` + `form-cro` into a single `cro` skill. If you installed the v1.x skills, you'll have **stale old-name folders** in your install directory after upgrading — the new skills install alongside the old ones, so you'll see both `skills/page-cro/` and `skills/cro/`, etc. Clean them up:

```bash
# From the directory where you installed the skills (e.g., .agents/skills/ or .claude/skills/)
rm -rf page-cro form-cro \
       ab-test-setup analytics-tracking aso-audit competitor-alternatives \
       email-sequence free-tool-strategy launch-strategy onboarding-cro \
       paid-ads paywall-upgrade-cro popup-cro pricing-strategy \
       product-marketing-context referral-program schema-markup \
       signup-flow-cro social-content
```

Then reinstall the v2.0 skills via your usual method (e.g., `npx skills add aaryapranshu/fulcrum-marketing-module`).

### Migrate the product marketing context file

In v2.0 the context file moved from `.claude/` to `.agents/` and was renamed from `product-marketing-context.md` to `product-marketing.md`. Move your existing context file:

```bash
mkdir -p .agents
# v2.0 file (or pre-v2.0 file with new name)
mv .claude/product-marketing.md .agents/product-marketing.md 2>/dev/null
# pre-v2.0 file with legacy name
mv .claude/product-marketing-context.md .agents/product-marketing.md 2>/dev/null
```

Skills will still check `.claude/` and the legacy `product-marketing-context.md` filename as fallbacks, so nothing breaks if you don't migrate.

### Full rename map

| Old | New |
|-----|-----|
| `ab-test-setup` | `ab-testing` |
| `analytics-tracking` | `analytics` |
| `aso-audit` | `aso` |
| `competitor-alternatives` | `competitors` |
| `email-sequence` | `emails` |
| `form-cro` | merged into `cro` |
| `free-tool-strategy` | `free-tools` |
| `launch-strategy` | `launch` |
| `onboarding-cro` | `onboarding` |
| `page-cro` | `cro` |
| `paid-ads` | `ads` |
| `paywall-upgrade-cro` | `paywalls` |
| `popup-cro` | `popups` |
| `pricing-strategy` | `pricing` |
| `product-marketing-context` | `product-marketing` |
| `referral-program` | `referrals` |
| `schema-markup` | `schema` |
| `signup-flow-cro` | `signup` |
| `social-content` | `social` |

## Usage

Once installed, just ask your agent to help with marketing tasks:

```
"Help me optimize this landing page for conversions"
→ Uses cro skill

"Write homepage copy for my SaaS"
→ Uses copywriting skill

"Set up GA4 tracking for signups"
→ Uses analytics skill

"Create a 5-email welcome sequence"
→ Uses emails skill
```

You can also invoke skills directly:

```
/cro
/emails
/seo-audit
```

## Skill Categories

### Conversion Optimization
- `cro` - Pages and forms
- `signup` - Registration flows
- `onboarding` - Post-signup activation
- `popups` - Modals and overlays
- `paywalls` - In-app upgrade moments

### Content & Copy
- `copywriting` - Marketing page copy
- `copy-editing` - Edit and polish existing copy
- `cold-email` - B2B cold outreach emails and sequences
- `emails` - Automated email flows
- `social` - Social media content
- `image` - AI image generation, design tools, and optimization

### SEO & Discovery
- `seo-audit` - Technical and on-page SEO
- `ai-seo` - AI search optimization (AEO, GEO, LLMO)
- `programmatic-seo` - Scaled page generation
- `site-architecture` - Page hierarchy, navigation, URL structure
- `competitors` - Comparison and alternative pages
- `schema` - Structured data

### Paid & Distribution
- `ads` - Google, Meta, LinkedIn ad campaigns
- `events` - Webinars, conferences, sponsorships, speaking
- `ad-creative` - Bulk ad creative generation and iteration
- `social` - Social media scheduling and strategy

### Measurement & Testing
- `analytics` - Event tracking setup
- `ab-testing` - Experiment design

### Retention
- `churn-prevention` - Cancel flows, save offers, dunning, payment recovery

### Growth Engineering
- `co-marketing` - Partner identification and joint campaigns
- `free-tools` - Marketing tools and calculators
- `referrals` - Referral and affiliate programs

### Strategy & Monetization
- `marketing-ideas` - 140 SaaS marketing ideas
- `marketing-psychology` - Mental models and psychology
- `launch` - Product launches and announcements
- `pricing` - Pricing, packaging, and monetization

### Sales & RevOps
- `revops` - Lead lifecycle, scoring, routing, pipeline management
- `sales-enablement` - Sales decks, one-pagers, objection docs, demo scripts

## Contributing

Issues and pull requests are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT. See [LICENSE](LICENSE).
