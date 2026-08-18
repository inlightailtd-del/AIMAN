"""
Aiman — Main FastAPI entry point.
Phase 0: skeleton only. Orchestrator, memory, and interface modules
get wired in here as they're built (Prompts 0.2 - 1.5 in the master doc).
"""

from fastapi import FastAPI
from dotenv import load_dotenv

load_dotenv()

app = FastAPI(title="Aiman", version="0.0.1")


@app.get("/health")
async def health_check():
    return {"status": "ok", "service": "aiman", "phase": "0"}


# Future: mount WhatsApp webhook router here once /interface/whatsapp.py exists
# from interface.whatsapp import router as whatsapp_router
# app.include_router(whatsapp_router)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
