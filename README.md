# ORCHIVOICE — Sarvam AI Powered Multilingual College Voice Assistant

> **Intelligent, real-time college voice assistant delivering natural spoken dialogue across English, Hindi, and Marathi with zero-hallucination guardrails.**

---

## 🎓 Overview

**Orchivoice** is an enterprise-grade AI voice assistant engineered specifically for colleges and universities. Instead of navigating complex portals or interacting with text chatbots, prospective students, current students, and parents can speak naturally with Orchivoice and receive instant, spoken college information.

### 🌟 Key Highlights
- **100% Sarvam AI Voice Pipeline**:
  - **Speech-to-Text (STT)**: Sarvam Saaras (`saaras:v4`) with streaming Indian accent and code-mixed recognition.
  - **Language Model (LLM)**: Sarvam-105B conversational Indic brain.
  - **Text-to-Speech (TTS)**: Sarvam Bulbul (`bulbul:v3`/`bulbul:v4-flash`) with natural Indian pronunciation.
- **Real-Time WebRTC Media**: Powered by **LiveKit Agents** for sub-second conversational latency and smooth natural barge-in / interruption handling.
- **Multilingual Support**:
  - English (Indian English)
  - Hindi (हिंदी)
  - Marathi (मराठी)
- **Role-Adaptive Personalities**:
  - **Student Mode**: Friendly, casual, conversational, and encouraging guidance on courses, campus life, labs, and clubs.
  - **Parent Mode**: Professional, respectful, reassuring, and transparent guidance on admissions, fees, hostel security, and discipline.
- **Strict Zero-Hallucination Knowledge Base**:
  - College administrators supply official information via structured JSON files in `knowledge-base/`.
  - All files default to pending placeholders (`is_verified: false`).
  - When verified records are not present, Orchivoice strictly refuses to fabricate figures and delivers the official verification fallback message.

---

## 🏛️ Project Structure

```
orchivoice/
├── backend/                  # Python LiveKit Voice Agent
│   ├── src/
│   │   ├── agent.py          # Real-time Sarvam voice pipeline & session coordinator
│   │   ├── knowledge.py      # Verified knowledge base retriever & fallback engine
│   │   └── prompt.py         # System prompt builder for Student & Parent modes
│   ├── tests/                # Automated backend test suite
│   ├── pyproject.toml        # Backend package definition
│   ├── requirements.txt      # Python dependencies
│   └── .env.example          # Backend environment template
├── frontend/                 # Next.js 15 + React 19 Frontend
│   ├── app/
│   │   ├── api/token/        # Secure LiveKit token dispenser with metadata
│   │   ├── layout.tsx        # Application root layout & fonts
│   │   └── page.tsx          # Main entrypoint
│   ├── components/           # UI components, visualizers & role selectors
│   ├── package.json          # Frontend dependencies
│   └── .env.example          # Frontend environment template
├── knowledge-base/           # Dedicated structured institutional records
│   ├── college_profile.json  # Basic college information, location, office hours
│   ├── admissions.json       # Cutoffs, entrance exams, procedures
│   ├── departments.json      # Engineering branches & intake capacities
│   ├── fees.json             # Tuition & category-wise fee concessions
│   ├── faculty.json          # Principal, leadership & department faculty
│   ├── placements.json       # Highest & average packages, recruiting companies
│   ├── facilities.json       # Library, hostels, sports & transportation
│   ├── events.json           # Cultural festivals & technical symposiums
│   ├── scholarships.json     # State & government scholarship schemes
│   ├── contact.json          # Official directory & emergency phone lines
│   └── faqs.json             # Verified multilingual FAQs
├── docs/                     # Comprehensive engineering documentation
│   ├── ARCHITECTURE.md       # Full architectural flow and component details
│   ├── KNOWLEDGE_BASE_GUIDE.md # Instructions for college administration
│   ├── DEPLOYMENT_GUIDE.md   # Deployment instructions for Vercel & LiveKit Cloud
│   └── TESTING_REPORT.md     # Verification tests across English, Hindi & Marathi
├── .gitignore                # Comprehensive Git ignore rules
├── .env.example              # Root environment template
└── README.md                 # Project overview and instructions
```

---

## ⚡ Quick Start

### 1. Configure Environment Variables
Copy `.env.example` in `backend/` and `frontend/`:

```bash
# In backend/.env
SARVAM_API_KEY=your_sarvam_api_key_here
LIVEKIT_URL=wss://your-project.livekit.cloud
LIVEKIT_API_KEY=your_livekit_api_key_here
LIVEKIT_API_SECRET=your_livekit_api_secret_here

# In frontend/.env.local
LIVEKIT_URL=wss://your-project.livekit.cloud
LIVEKIT_API_KEY=your_livekit_api_key_here
LIVEKIT_API_SECRET=your_livekit_api_secret_here
NEXT_PUBLIC_COLLEGE_NAME="College of Engineering & Technology"
```

### 2. Start the Backend Voice Agent
```bash
cd backend
# Activate virtual environment
.venv\Scripts\activate   # Windows
# source .venv/bin/activate # Linux/macOS

# Run in development mode
python src/agent.py dev
```

### 3. Start the Frontend Application
```bash
cd frontend
pnpm dev
```
Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 🛡️ Zero-Hallucination Fallback Behavior

When institutional facts have not yet been populated into `knowledge-base/*.json`, Orchivoice responds with official, natural fallbacks:

- **English**:
  > *"I'm sorry, I don't have verified information about that right now. Please contact the college office for confirmation."*
- **Hindi (हिंदी)**:
  > *"क्षमा करें, मेरे पास अभी इस बारे में सत्यापित जानकारी नहीं है। कृपया पुष्टि के लिए कॉलेज कार्यालय से संपर्क करें।"*
- **Marathi (मराठी)**:
  > *"मला माफ करा, माझ्याकडे सध्या याबद्दल पडताळणी केलेली माहिती नाही. कृपया खात्री करण्यासाठी महाविद्यालयीन कार्यालयाशी संपर्क साधा."*

To populate verified records, see [`docs/KNOWLEDGE_BASE_GUIDE.md`](./docs/KNOWLEDGE_BASE_GUIDE.md).

---

## 🧪 Testing

Run backend verification checks:
```bash
cd backend
.venv\Scripts\python.exe -c "import sys; sys.path.insert(0, 'src'); from knowledge import KnowledgeBaseRetriever; r = KnowledgeBaseRetriever(); print(r.query_college_information('admission', 'en'))"
```

---

## 🚀 Deployment

- **Frontend**: One-click deployment to **Vercel** with Next.js edge runtime.
- **Backend**: Deploy directly to **LiveKit Cloud Agent Service** or via Docker container.
- See [`docs/DEPLOYMENT_GUIDE.md`](./docs/DEPLOYMENT_GUIDE.md) for full instructions.
